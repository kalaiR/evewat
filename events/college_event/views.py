from django.shortcuts import render_to_response, redirect, render
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse
from events.models import *
from college_event.models import *
from college_event.views import *
from events.models import Userprofile

from events.forms import *
from events.forms import UserForm
from college_event.forms import EventSearchForm

from django.core.files import File
from django.contrib.auth.models import User
from templated_email import send_templated_mail

from django.core.context_processors import csrf 
from django.views.decorators.csrf import csrf_protect, csrf_exempt

from django.core.exceptions import ValidationError
from django.utils.translation import ugettext, ugettext_lazy as _
from django.contrib import messages
from events.models import Userprofile
from banner.models import *
from django.contrib.auth import authenticate, login,logout
from django.template import Context
# from django.template.loader import get_template
from django.template.response import TemplateResponse
from events.util import format_redirect_url
from payu.models import *
from transaction.models import *
from django.utils import simplejson
import simplejson as json
from events.util import get_current_country_cities
# from events.context_processors import *
#For geo
from django.contrib.gis.geoip import GeoIP
from events import globals

from django.contrib.auth.decorators import login_required
import random
import string
import datetime

import time
import openpyxl
from forms import UploadFileForm

class JSONResponse(HttpResponse):
    def __init__(self, data):
        super(JSONResponse, self).__init__(
                simplejson.dumps(data), mimetype='application/json')
# Create your views here.
def home(request):
    subcategory = SubCategory.objects.all()
    city =get_current_country_cities(request)
    recentad = Postevent.objects.filter().order_by('-id')[:4]
    ctx = {'subcategory':subcategory, 'city': city,'recentad':recentad}
    return render_to_response("index.html",ctx, context_instance=RequestContext(request))

@csrf_protect 
def user_login(request):
    """
    Login User
    """
    logout(request)
    username = password = ''
    if request.POST.get("next") is None:
        return HttpResponseRedirect('/')
    elif request.POST.get("next"):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                return HttpResponseRedirect(request.POST.get("next"))
        try:
            error={}
            if '@' in username:
                if not User.objects.filter(email=username).exists():
                    error['email_exists'] = ugettext('Email Does not exists')
                    print "error['email_exists']",error['email_exists']
                    raise ValidationError(error['email_exists'], 1)
            else:
                if not User.objects.filter(username=username).exists():
                    error['username_exists'] = ugettext('Username Does not exists')
                    print "error['username_exists']",error['username_exists']
                    raise ValidationError(error['username_exists'], 2)
        except ValidationError as e:
            messages.add_message(request, messages.ERROR, e.messages[-1]) 
            redirect_path = request.POST["next"]
            query_string = 'lst=%d' % e.code
            redirect_url = format_redirect_url(redirect_path, query_string)
            return HttpResponseRedirect(redirect_url)
        if not error:
            if not '@' in username:
                user = User.objects.get(username=username)
            else:
                user = User.objects.get(email=username)
            user.backend='django.contrib.auth.backends.ModelBackend'
            try:
                error={}
                if user.check_password(password):
                    print user
                else:
                    error['password'] = ugettext('Invalid password')
                    raise ValidationError(error['password'], 3)
            except ValidationError as e:
                messages.add_message(request, messages.ERROR, e.messages[-1]) 
                redirect_path = request.POST["next"]
                query_string = 'lst=%d' % e.code
                redirect_url = format_redirect_url(redirect_path, query_string)
                return HttpResponseRedirect(redirect_url) 
            if user:           
                if user.is_active:                
                    login(request, user)
                    print user.id
                    user_id=user.id
                    response=HttpResponseRedirect(request.POST["next"]) 
                    return response               
    else:
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                return HttpResponseRedirect('/')

def logout_view(request):
    logout(request)
    response = HttpResponseRedirect("/")
    return response

@csrf_protect
def register(request):  
    context = RequestContext(request) 
    registered = False
    user=User()
    userprofile=Userprofile()
    if request.method == 'POST': 
        email=request.POST['email_id']
        username=request.POST['username']
        
        try:
            error={}
            if User.objects.filter(username=username).exists():
                error['username_exists'] = ugettext('Username already exists')
                # print "error['username_exists']",error['username_exists']
                raise ValidationError(error['username_exists'], 1)
            if User.objects.filter(email=email).exists():
                error['email_exists'] = ugettext('Email already exists')
                # print "error['email_exists']",error['email_exists']
                raise ValidationError(error['email_exists'], 2)     
        except ValidationError as e:
            messages.add_message(request, messages.ERROR, e.messages[-1]) 
            redirect_path = "/"
            query_string = 'rst=%d' % e.code
            redirect_url = format_redirect_url(redirect_path, query_string)
            return HttpResponseRedirect(redirect_url)

        if not error:
            user.is_active = True
            user.username=request.POST['username']
            user.email=request.POST['email_id']
            user.password=request.POST['password']
            user.set_password(user.password)
            user.save()
            userprofile = Userprofile()
            userprofile.user_id=user.id
            userprofile.lastname = lastname=request.POST['lastname']
            userprofile.mobile=request.POST['mobile']

            
            # if request.POST['select_city'] != '' and request.POST['select_city'] != 'select_city':
            #     city=City.objects.get(id=request.POST['select_city'])
            #     userprofile.city_id = city.id
            # if request.POST['select_college'] != '' and request.POST['select_college'] != 'select_college':
            #     college=College.objects.get(id=request.POST['select_college'])
            #     userprofile.college_id =college.id
            # if request.POST['select_dept'] != '' and request.POST['select_dept'] != 'select_department':
            #     department=Department.objects.get(id=request.POST['select_dept'])
            #     userprofile.department_id =department.id

            userprofile.confirmation_code = ''.join(random.choice(string.ascii_uppercase + string.digits + string.ascii_lowercase) for x in range(33))
            userprofile.save()          
            # send_registration_confirmation(user)
            registered = True
            user = User.objects.get(username=user.username)
            print "user", user
            user.backend='django.contrib.auth.backends.ModelBackend'
            login(request, user)    
            return HttpResponseRedirect('/start/?user_id=' + str(user.id))
    elif user.id is None:
        return HttpResponseRedirect('/')
    else:    
        user_id = user.id
        return render_to_response('index.html', {'user_id':user_id} ,context_instance=RequestContext(request))


# def send_registration_confirmation(user):
#   p = user.get_profile()
#   title = "Evewat account confirmation"
#   content = "http://localhost:8000/confirm/" + str(p.confirmation_code) + "/" + user.username
#   send_templated_mail(
#               template_name = 'welcome',
#               subject = 'Welcome Evewat',
#               from_email = 'testmail123sample@gmail.com',
#               recipient_list = [user.email],
#               context={
#                        'user': user,
#                        'content':content,
                         
#               },
#           )

def confirm(request, confirmation_code, username):    
    try:
        user = User.objects.get(username=username)        
        print user.id
        profile = user.get_profile()
       
        # if profile.confirmation_code == confirmation_code and user.date_joined > (datetime.datetime.now()-datetime.timedelta(days=1)):
        if profile.confirmation_code == confirmation_code:
            # user.is_active = True
            profile.is_emailverified=True
            print "user.is_emailverified", profile.is_emailverified
            # user.save()
            profile.save()
            user.backend='django.contrib.auth.backends.ModelBackend'
            login(request, user)
            print "confirm7"
        return HttpResponseRedirect('/start/?user_id=' + str(user.id))    
    except:
        return HttpResponseRedirect('../../../../../')

def start(request):
    # print 'start'
    # city=City.objects.all()
    # category=Category.objects.all()
    path=request.path
    # print path
    # event =event.objects.all()
    # recentad=event.objects.filter().order_by('-id')[:3]
    user_id=Userprofile.objects.get(user_id=request.user.id)
    # print "user start", user_id
    
    if request.user.is_authenticated:
        userprofile=Userprofile.objects.get(user_id=request.user.id)
    return render_to_response('index.html',{'path':path, 'userprofile':userprofile},context_instance=RequestContext(request))

def post_event(request):
    subcategory = SubCategory.objects.all()
    print 'subcategory from postevent',subcategory
    premium=PremiumPriceInfo.objects.all()
    return render_to_response("post_event.html",{'premium':premium,'subcategory':subcategory}, context_instance=RequestContext(request))

def post_event_v2(request):
    category= Category.objects.all()
    subcategory = SubCategory.objects.all()
    state=City.objects.values_list('state',flat=True)
    premium=PremiumPriceInfo.objects.all()
    return render_to_response("post_event_v2.html",{'premium':premium,'subcategory':subcategory,'category':category,'state':list(set(state))}, context_instance=RequestContext(request))

def submit_event(request):
    if request.method=="POST":
        event_name=request.POST['name']
        event_email=request.POST['email']
        event_mobile=request.POST.get('mobile','0')
        event_reg_fee=request.POST['registrationfees']
        event_poster=request.FILES.getlist('poster[]')
        def handle_uploaded_file(f):            
            event_poster = open('events/static/img/' + '%s' % f.name, 'wb+')
            # print "settings.FOR_IMG",settings.STATIC_ROOT 
            for chunk in f.chunks():
                event_poster.write(chunk)
            event_poster.close()
        photosgroup = ''
        
        count=len(event_poster)
        for uploaded_file in event_poster:
            count=count-1
            handle_uploaded_file(uploaded_file)
            if count==0:
                photosgroup=photosgroup  + '/static/img/' + str(uploaded_file)
            else:
                photosgroup=photosgroup  + '/static/img/' +str(uploaded_file) + ','
        event_poster=photosgroup
        event_contactperson=request.POST['queries']
        event_registrationurl=request.POST['festurl']
        event_festdescription=request.POST['festdescription']
        event_venuedescription=request.POST['reach']
        event_city=City.objects.get(id=request.POST['city'])
        event_festname=request.POST['festname']
        event_festcaption=request.POST['festcaption']
        event_temp=SubCategory.objects.get(id=request.POST['festtype'])
        print "event_temp", event_temp
        event_festtype_id=event_temp.id
        event_state=request.POST['state']
        event_startdate=request.POST['startdate']
        event_enddate=request.POST['enddate']
        event_deadline=request.POST['deadline']
        print request.POST['userstatus']
        #if request.POST['userstatus']=='free':
        postevent=Postevent()
        postevent.name=event_name
        postevent.email=event_email
        postevent.mobile=event_mobile
        postevent.registrationfee=event_reg_fee
        postevent.poster=event_poster
        postevent.contactperson=event_contactperson
        postevent.registrationurl=event_registrationurl
        postevent.festdescription=event_festdescription
        postevent.venuedescription=event_venuedescription
        postevent.city=event_city
        postevent.festname=event_festname
        postevent.festcaption=event_festcaption
        postevent.festtype_id=event_festtype_id
        postevent.state=event_state
        postevent.startdate=event_startdate
        postevent.enddate=event_enddate
        postevent.deadline=event_deadline
        postevent.save()
    


        message="Your data succesfully submitted"
        if request.POST['price']:
            price=request.POST.get('price','0')
        response=render_to_response("post_event.html",{'message':message}, context_instance=RequestContext(request))
        response.set_cookie('price',price)
    return response

def submit_event_v2(request):
    try:
        if request.method=="POST":
            postevent=Postevent_v2()
            postevent.name=request.POST['name']
            postevent.email=request.POST['email']
            postevent.mobile=request.POST.get('mobile','0')
            postevent.event_title=request.POST.get('eventtitle','')
            startdate=request.POST.get('startdate','')
            date,month,year=startdate.split('-')
            postevent.startdate=year+'-'+month+'-'+date
            enddate=request.POST.get('enddate','')
            date,month,year=enddate.split('-')
            postevent.enddate=year+'-'+month+'-'+date
            postevent_category=Category.objects.get(id=request.POST.get('category',''))
            postevent.category=postevent_category
            postevent_subcategory=SubCategory.objects.get(id=request.POST.get('eventtype',''))
            postevent.eventtype=postevent_subcategory
            postevent.eventdescription=request.POST.get('eventdescription','')
            postevent.address=request.POST.get('address','')
            postevent.organizer=request.POST.get('organizer','')
            postevent.state=request.POST.get('state','')
            postevent_city=City.objects.get(id=request.POST.get('city',''))
            postevent.city=postevent_city
            postevent_college=College.objects.get(id=request.POST.get('college',''))
            postevent.college=postevent_college
            postevent.department=request.POST.get('dept','')
            postevent_poster=request.FILES.getlist('poster[]')
            def handle_uploaded_file(f):            
                postevent_poster = open('events/static/img/' + '%s' % f.name, 'wb+')
                # print "settings.FOR_IMG",settings.STATIC_ROOT 
                for chunk in f.chunks():
                    postevent_poster.write(chunk)
                postevent_poster.close()
            photosgroup = ''
            
            count=len(postevent_poster)
            for uploaded_file in postevent_poster:
                count=count-1
                handle_uploaded_file(uploaded_file)
                if count==0:
                    photosgroup=photosgroup  + '/static/img/' + str(uploaded_file)
                else:
                    photosgroup=photosgroup  + '/static/img/' +str(uploaded_file) + ','
            postevent.poster=photosgroup
            if request.POST.get('plan')!='0':
                postevent.payment=request.POST.get('plan')
            postevent.save()
            message="Your data succesfully submitted"
            # paiduser=PremiumPriceInfo.objects.get(purpose='paid')
            # premium_amount=int(paiduser.premium_price)
            user_amount=request.POST.get('plan')
            if user_amount!='0':
                return HttpResponseRedirect('/payment_event/')
            else:
                response=render_to_response("post_event_v2.html",{'message':message}, context_instance=RequestContext(request))
                response.delete_cookie('eventtitle')
                response.delete_cookie('startdate')
                response.delete_cookie('enddate')
                response.delete_cookie('plan')
                response.delete_cookie('category_name')
                response.delete_cookie('eventtype_name')
                response.delete_cookie('eventtype')
                response.delete_cookie('category')
                response.delete_cookie('eventdescription')
                return response
    except:
        response = render_to_response("post_event_v2.html",{'message':'Something went to wrong'}, context_instance=RequestContext(request))
        response.delete_cookie('eventtitle')
        response.delete_cookie('startdate')
        response.delete_cookie('enddate')
        response.delete_cookie('plan')
        response.delete_cookie('category_name')
        response.delete_cookie('eventtype_name')
        response.delete_cookie('eventtype')
        response.delete_cookie('category')
        response.delete_cookie('eventdescription')
        return response

def all_subcategory_for_category(request):

    if request.is_ajax():
        objs1 = SubCategory.objects.all()
        return JSONResponse([{'name': o1.name, 'id': o1.id} for o1 in objs1])       
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})

def subcategory_for_category(request):
    print "subcategory_for_category"
    if request.is_ajax() and request.GET and 'category_id' in request.GET:
        print request.GET['category_id']         
        objs1 = SubCategory.objects.filter(category__id=request.GET['category_id'])
        return JSONResponse([{'name': o1.name, 'id': o1.id}
            for o1 in objs1])       
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})

def event_for_subcategory(request):
    # print "brand_for_subcategory"
    if request.is_ajax() and request.GET and 'sub_category_id' in request.GET:
        print request.GET['sub_category_id'] 
        # objs1 = Dropdown.objects.filter(subcat_refid=request.GET['sub_category_id']).exclude(brand_name='')
        objs1 = Postevent.objects.filter(festtype_id=sub_category_id)
        print 'objs1 in subcategory', objs1
        for obj in objs1:
            print obj.brand_name        
        return JSONResponse([{'id': o1.id, 'name': smart_unicode(o1.brand_name)}
            for o1 in objs1])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})        


def event(request,pname=None):
    postevent=Postevent.objects.filter(festtype=pname)
    college=College.objects.all()
    return render_to_response("search-result.html",{'events':postevent,'pname':pname, 'college':college}, context_instance=RequestContext(request))

def details(request,id=None):

    postevent=Postevent_v2.objects.get(pk=id)
    print 'postevent',postevent.city
    
    # g = GeoIP()
    # city=City.objects.get()
    return render_to_response("company-profile.html",{'events':postevent}, context_instance=RequestContext(request))

def banner(request):
    return render_to_response("uploadbanner.html",context_instance=RequestContext(request))

# def store_payudetails(request):
#   #Code for storing Payu Details
#   payudetails=PayuDetails()
    
#   payudetails.status=request.POST.get('status')
#   payudetails.amount=request.POST.get('amount')
#   payudetails.save()

#   # response.set_cookie('payudetails',payudetails.id)
#   # response.set_cookie('payustatus',payudetails.status)
#   return payudetails.id,payudetails.status


@csrf_exempt
def upload_banner(request):
    print "enter"
    if request.POST.get('link',False):
        uploadbanner=SiteBanner()
        # print uploadbanner   request.POST.get('start',request.COOKIES.get('checkin'))
        uploadbanner.price=request.POST.get('price',request.COOKIES.get('price'))
        print "uploadbanner.price",uploadbanner.price
        uploadbanner.position=request.POST.get('position',request.COOKIES.get('position'))
        print "uploadbanner.position",uploadbanner.position
        uploadbanner.pageurl=request.POST.get('pageurl',request.COOKIES.get('pageurl'))
        uploadbanner.banner=request.FILES.get('banner',request.COOKIES.get('banner'))
        print "uploadbanner.banner",uploadbanner.banner
        uploadbanner.link=request.POST['link']
        uploadbanner.save()
        response=HttpResponseRedirect("/payment/")
        response.set_cookie( 'price', uploadbanner.price )
        response.set_cookie( 'position', uploadbanner.position )
        response.set_cookie( 'banner', uploadbanner.banner )
        response.set_cookie( 'pageurl', uploadbanner.pageurl )
        
        
    else:
        #Code for storing Payu Details
        # payudetails=PayuDetails()
        
        # payudetails.status=request.POST.get('status')
        # payudetails.amount=request.POST.get('amount')
        # payudetails.save()

        # response.set_cookie('payudetails',payudetails.id)
        # response.set_cookie('payustatus',payudetails.status)

        # transaction=Transaction()
        # # transaction.order=Order.objects.get(id=request.COOKIES.get('orderdetails'))
        # # transaction.payu_details=PayuDetails.objects.get(id=request.COOKIES.get('payudetails'))
        # transaction.payu_status=request.COOKIES.get('payustatus')
        # print "transaction.payu_status",transaction.payu_status
        # transaction.save()

        # payid, paystatus=store_payudetails(request)
        # print "payid", payid
        # print "paystatus", paystatus
        # # response = render_to_response("success.html",context_instance=RequestContext(request))
        # response.set_cookie('payudetails',payid)
        # response.set_cookie('payustatus',paystatus)
        # response.set_cookie('orderdetails',order.id)
        message="Your data succesfully uploaded"
        response = render_to_response("uploadbanner.html",{'message':message},context_instance=RequestContext(request))
        
        
        
    return response

@csrf_exempt
def success(request):
    if 'field9' in request.POST:
        # order=Order()
        # user=User()   
        # # order.user =User.objects.get(username=username)
        # order.price=request.COOKIES.get('price')
        # order.position=request.COOKIES.get('position')
        # order.banner=request.COOKIES.get('banner')
        # order.save()
        # transaction=Transaction()
        # # transaction.order=Order.objects.get(id=request.COOKIES.get('orderdetails'))
        # # transaction.payu_details=PayuDetails.objects.get(id=request.COOKIES.get('payudetails'))
        # transaction.payu_status=request.COOKIES.get('payustatus')
        # print "transaction.payu_status",transaction.payu_status
        # transaction.save()
        # payid, paystatus=store_payudetails(request)
        # print "payid", payid
        # print "paystatus", paystatus
        response = render_to_response("success.html",context_instance=RequestContext(request))
        # response.set_cookie('payudetails',payid)
        # response.set_cookie('payustatus',paystatus)
        # response.set_cookie('orderdetails',order.id)
        response.delete_cookie('plan')
    else:
        response =HttpResponseRedirect('/') 
    return response
    
def success_event(request): 
    return render_to_response("success.html",context_instance=RequestContext(request))

def find_colleges(request):
    from django.utils.encoding import smart_unicode, force_unicode
    if request.is_ajax() and request.GET and 'city_id' in request.GET:
        print request.GET['city_id']
        objs = College.objects.filter(city=request.GET['city_id'])
        print "objs", objs
        return JSONResponse([{'id': o.id, 'name': smart_unicode(o.college_name)}
        for o in objs])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})

def find_department(request):
    from django.utils.encoding import smart_unicode, force_unicode
    if request.is_ajax() and request.GET and 'college_id' in request.GET:
        print request.GET['college_id']
        objs = CollegeDepartment.objects.filter(college__id=request.GET['college_id'])
        print "objs", objs
        return JSONResponse([{'id': o.department.id, 'name': smart_unicode(o.department)}
        for o in objs])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})
    

def find_subcategory(request):
    from django.utils.encoding import smart_unicode, force_unicode
    if request.is_ajax() and request.GET and 'category_id' in request.GET:
        print request.GET['category_id']
        objs = SubCategory.objects.filter(category__id=request.GET['category_id'])
        print "objs", objs
        return JSONResponse([{'id': o.id, 'name': smart_unicode(o.name)}
        for o in objs])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})

def find_city(request):
    from django.utils.encoding import smart_unicode, force_unicode
    if request.is_ajax() and request.GET and 'state' in request.GET:
        print request.GET['state']
        objs = City.objects.filter(state=request.GET['state'])
        return JSONResponse([{'id': o.id, 'name': smart_unicode(o.city)}
        for o in objs])
    else:
        return JSONResponse({'error': 'Not Ajax or no GET'})
    
def getcity(request):
    from collections import OrderedDict
    results = []
    unsort_dict = {}
    key_loc = request.GET.get('term')
    state=request.GET.get('state')
    filterargs = { 'state': state, 'city__icontains': key_loc }
    city_lists = City.objects.filter(**filterargs)
    for city_list in city_lists:
        cityname = city_list.city.strip()
        cityid = city_list.id
        unsort_dict[cityname] = {'cityid':cityid, 'label':cityname, 'value':cityname}

    sorted_dic = OrderedDict(sorted(unsort_dict.iteritems(), key=lambda v: v[0]))
    for k, v in sorted_dic.iteritems():  
        results.append(v)

    return HttpResponse(simplejson.dumps(results), mimetype='application/json')

def importcollegedata(request):

  saved = False
  saved_leads = []
  
  if request.method == 'POST':
    form = UploadFileForm(request.POST, request.FILES)
    
    if form.is_valid():
      
      f = request.FILES['file']
      path = os.path.join(settings.MEDIA_ROOT, 'imports')
      
      if not os.path.isdir(path):
        os.mkdir(path)
        
      path = os.path.join(path, "%s_%s"%(request.user.pk, time.time())) 

      destination = open(path, 'wb+')
      for chunk in f.chunks():
        destination.write(chunk)
      destination.close()      
      
      
      workbook = openpyxl.load_workbook(filename=path)      
      sheet_names = workbook.get_sheet_names()

      for sheet_name in sheet_names:
        sheet = workbook.get_sheet_by_name(sheet_name)
        if sheet_name == 'Sheet1':            
            rows = sheet.get_highest_row()
            cols = sheet.get_highest_column()

            city_mapping = {}
            collegeaddress_mapping = {}
            collegecategory_mapping = {}

            # consumeraddress_mapping = {}
            # consumercompanyaddress_mapping = {}
            # consumercompany_mapping = {}
            # consumer_mapping = {}
            # lead_mapping = {}
            # leadkeyword_mapping = {}
            # leadcategory_mapping = {}

            city_fields = [f.attname for f in City._meta.local_fields]
            collegename_fields = [f.attname for f in College._meta.local_fields]
            collegecategory_fields = [f.attname for f in Category._meta.local_fields]

            # consumeraddress_fields = [f.attname for f in ConsumerAddress._meta.local_fields]
            # consumercompanyaddress_fields = [f.attname for f in CompanyAddress._meta.local_fields]
            # lead_fields = [f.attname for f in Lead._meta.local_fields]
            # consumer_fields = [f.attname for f in Consumer._meta.local_fields]
            # consumercompany_fields = [f.attname for f in ConsumerCompany._meta.local_fields]
            # consumercompany_fields += [f.attname for f in CompanyAbstract._meta.fields]
            # leadkeyword_fields = [f.attname for f in LeadKeyword._meta.local_fields]
            # leadcategory_fields = [f.attname for f in LeadCategory._meta.local_fields]
            
            if rows > 1 and cols > 0 and sheet.cell(row=0, column=0) is not None:                            
              for i in range( cols ):              
                v = sheet.cell(row=0, column=i).value
                v = v.replace(' ', '_').lower()                
                
                if v.startswith('city'):
                   v = v.replace('city_', '')
                   if v in city_fields:
                     city_mapping[v] = i
                
                if v.startswith('state'):                   
                   v = v.replace('state_', '')
                   if v in city_fields:
                     city_mapping[v] = i
                
                if v.startswith('country_code'):                   
                   v = v.replace('country_code_', '')
                   if v in city_fields:
                     city_mapping[v] = i
                
                if v.startswith('country_name'):                   
                   v = v.replace('country_name_', '')
                   if v in city_fields:
                     city_mapping[v] = i               
                
                if v.startswith('college_name'):                   
                   v = v.replace('college_name_', '')
                   if v in collegename_fields:
                     collegeaddress_mapping[v] = i

                if v.startswith('name'):                   
                   v = v.replace('name_', '')
                   if v in collegecategory_fields:
                     collegecategory_mapping[v] = i     
                                          
                
                # if v.startswith('consumer_consumercompanyaddress'):
                #    v = v.replace('consumer_consumercompanyaddress_', '')
                #    if v in consumercompanyaddress_fields:
                #       consumercompanyaddress_mapping[v] = i
                
                # if v.startswith('consumer_consumercompany'):
                #    v = v.replace('consumer_consumercompany_', '')
                #    if v in consumercompany_fields:
                #       consumercompany_mapping[v] = i
                 
                # if v.startswith('consumer'):
                #    v = v.replace('consumer_', '')
                #    if v in consumer_fields:
                #      consumer_mapping[v] = i
                            
                # if v.startswith('leadkeyword'):
                #    v = v.replace('leadkeyword_', '')
                #    #v = v.replace('leadkeyword_', '')
                #    if v in leadkeyword_fields: 
                #      leadkeyword_mapping[v] = i
                
                # if v.startswith('leadcategory'):
                #    v = v.replace('leadcategory_', '')
                #    #v = v.replace('leadkeyword_', '')
                #    if v in leadcategory_fields: 
                #      leadcategory_mapping[v] = i   
                        
                else:
                    print 'else-1'      
                  # if v in lead_fields:
                  #   lead_mapping[v] = i              
              
              print 'rows===>', rows
              for i in range(1, rows):                
                citylist = City() if len(city_mapping.keys()) > 0 else None                 
                collegelist = College() if len(collegeaddress_mapping.keys()) > 0 else None
                collegecategorylist = Category() if len(collegecategory_mapping.keys()) > 0 else None                      

                print 'city_mapping'
                for field in city_mapping:
                  col = city_mapping[field]
                  v = sheet.cell(row=i, column=col)                                
                  if v:                    
                    setattr(citylist, field, v.value)

                for field in collegeaddress_mapping:
                  col = collegeaddress_mapping[field]
                  v = sheet.cell(row=i, column=col)                                
                  if v:
                    setattr(collegelist, field, v.value)    
                
                for field in collegecategory_mapping:
                  col = collegecategory_mapping[field]
                  v = sheet.cell(row=i, column=col)                                
                  if v:                    
                    setattr(collegecategorylist, field, v.value)                
                
                if citylist:
                  if not City.objects.filter(city=citylist.city).exists():
                    citylist.save() 

                if collegecategorylist:
                  if not Category.objects.filter(name=collegecategorylist.name).exists():
                    collegecategorylist.save()      

                if collegelist:
                  if City.objects.filter(city=citylist.city).exists():
                    cityvalue = City.objects.filter(city=citylist.city)                    
                    for c in cityvalue:
                        collegelist.city_id = c.id
                    collegelist.save()
                  
                  if Category.objects.filter(name=collegecategorylist.name).exists():
                    categoryvalue = Category.objects.filter(name=collegecategorylist.name)                    
                    for c in categoryvalue:
                        collegelist.collegetype_id = c.id
                    collegelist.save()  
          
      saved = True
      success_import= 'Successfully imported'
      return render_to_response('import.html', {'success_import':success_import, 'form': form, 'saved':saved, 'saved_leads': saved_leads}, context_instance=RequestContext(request))
  else:
    form = UploadFileForm()
      
  return render_to_response('import.html', {'form': form, 'saved':saved, 'saved_leads': saved_leads}, 
    context_instance=RequestContext(request))


def getstate(request):
    from collections import OrderedDict
    results = []
    unsort_dict = {}
    key_loc = request.GET.get('term')
    state_lists = City.objects.filter(state__icontains=key_loc)

    for state_list in state_lists:
        statename = state_list.state.strip()
        stateid = state_list.id
        unsort_dict[statename] = {'stateid':stateid, 'label':statename, 'value':statename}

    sorted_dic = OrderedDict(sorted(unsort_dict.iteritems(), key=lambda v: v[0]))
    for k, v in sorted_dic.iteritems():  
        results.append(v)

    return HttpResponse(simplejson.dumps(results), mimetype='application/json')

def getcollege(request):
    from collections import OrderedDict
    results = []
    unsort_dict = {}
    key_loc = request.GET.get('term')
    city=request.GET.get('city')
    filterargs = { 'city_id': city, 'college_name__icontains': key_loc }
    college_lists = College.objects.filter(**filterargs)

    for college_list in college_lists:
        collegename = college_list.college_name.strip()
        collegeid = college_list.id
        unsort_dict[collegename] = {'collegeid':collegeid, 'label':collegename, 'value':collegename}

    sorted_dic = OrderedDict(sorted(unsort_dict.iteritems(), key=lambda v: v[0]))
    for k, v in sorted_dic.iteritems():  
        results.append(v)

    return HttpResponse(simplejson.dumps(results), mimetype='application/json')

def getdept(request):
    from collections import OrderedDict
    results = []
    unsort_dict = {}
    key_loc = request.GET.get('term')
    college=request.GET.get('college')
    filterargs={'college__id':college}
    department_lists = Department.objects.filter(department__icontains=key_loc)
    for department_list in department_lists:
        departmentname = department_list.department.strip()
        departmentid = department_list.id
        unsort_dict[departmentname] = {'departmentid':departmentid, 'label':departmentname, 'value':departmentname}

    sorted_dic = OrderedDict(sorted(unsort_dict.iteritems(), key=lambda v: v[0]))
    for k, v in sorted_dic.iteritems():  
        results.append(v)

    return HttpResponse(simplejson.dumps(results), mimetype='application/json')


def getcity_base(request):
    from collections import OrderedDict
    results = []
    unsort_dict = {}
    key_loc = request.GET.get('term')
    city_lists = City.objects.filter(city__icontains= key_loc)

    for city_list in city_lists:
        cityname = city_list.city.strip()
        cityid = city_list.id
        unsort_dict[cityname] = {'cityid':cityid, 'label':cityname, 'value':cityname}

    sorted_dic = OrderedDict(sorted(unsort_dict.iteritems(), key=lambda v: v[0]))
    for k, v in sorted_dic.iteritems():  
        results.append(v)

    return HttpResponse(simplejson.dumps(results), mimetype='application/json')
    


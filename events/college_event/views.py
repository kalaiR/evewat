from django.shortcuts import render_to_response, redirect, render
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse
from events.models import *
from college_event.models import *
from college_event.views import *

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


from django.contrib.auth.decorators import login_required
import random
import string
import datetime

class JSONResponse(HttpResponse):
	def __init__(self, data):
		super(JSONResponse, self).__init__(
				simplejson.dumps(data), mimetype='application/json')
# Create your views here.
def home(request):
	subcategory = SubCategory.objects.all()
	college = College.objects.all()
	dept=Department.objects.all()
	city =get_current_country_cities(request)
	recentad = Postevent.objects.filter().order_by('-id')[:4]
	ctx = {'subcategory':subcategory, 'city': city,'college':college,'recentad':recentad,'dept':dept}
	return render_to_response("index.html",ctx, context_instance=RequestContext(request))

@csrf_protect 
def user_login(request):
	"""
	Login User
	"""
	logout(request)
	username = password = ''	

	if request.POST["next"] != "http://localhost:8000/register/" :
		# print "request.POST['next']", request.POST['next']		

		username = request.POST['username']
		# print 'username', username
		password = request.POST['password']
		# print 'password', password
		user = authenticate(username=username, password=password)
		# print 'user', user
		if user is not None:
			if user.is_active:
				login(request, user)
				return HttpResponseRedirect(request.POST["next"])
	else:
		username = request.POST['username']
		password = request.POST['password']
		user = authenticate(username=username, password=password)
		if user is not None:
			if user.is_active:
				login(request, user)
				return HttpResponseRedirect('/')
	return render_to_response('index.html',{'username':username},context_instance=RequestContext(request))

def logout_view(request):
	logout(request)
	response = HttpResponseRedirect("/")
	return response

@csrf_protect
def register(request):  
	# print 'register'
	context = RequestContext(request) 
	registered = False
	user=User()
	userprofile=Userprofile()
	if request.method == 'POST': 

		email=request.POST['email_id']
		# print 'email', email
		username=request.POST['username']
		# print 'username', username

		try:
			error={}
			if User.objects.filter(email=email).exists():
				error['email_exists'] = ugettext('Email already exists')
				# print "error['email_exists']",error['email_exists']
				raise ValidationError(error['email_exists'], 1)
			if User.objects.filter(username=username).exists():
				error['username_exists'] = ugettext('Username already exists')
				# print "error['username_exists']",error['username_exists']
				raise ValidationError(error['username_exists'], 2)
		except ValidationError as e:
			messages.add_message(request, messages.ERROR, e.messages[-1]) 
			redirect_path = "/"
			query_string = 'st=%d' % e.code
			redirect_url = format_redirect_url(redirect_path, query_string)
			return HttpResponseRedirect(redirect_url)

		if not error:
			user.is_active = True
			user.username=request.POST['username']
			# print 'user.username', user.username
			user.email=request.POST['email_id']
			# print 'post email', user.email
			user.password=request.POST['password']
			# print 'post pswd', user.password 
			user.set_password(user.password)
			# user.first_name=request.POST['user_id']
			user.save()
			userprofile = Userprofile()
			userprofile.user_id=user.id
			userprofile.lastname = lastname=request.POST['lastname']
			userprofile.mobile=request.POST['mobile']

			if request.POST['select_city'] != '':
				city=City.objects.get(id=request.POST['select_city'])
				userprofile.city_id = city.id
			if request.POST['select_college'] != '':
				college=College.objects.get(id=request.POST['select_college'])
				userprofile.college_id =college.id
			if request.POST['select_dept'] != '':
				department=Department.objects.get(id=request.POST['select_dept'])
				userprofile.department_id =department.id	

			userprofile.confirmation_code = ''.join(random.choice(string.ascii_uppercase + string.digits + string.ascii_lowercase) for x in range(33))
			# print confirmation_code
			
			# print 'p', p
			userprofile.save()			
			# send_registration_confirmation(user)
			registered = True
			user = User.objects.get(username=user.username)
			print "user",user
			# print 'reg user', user
			user.backend='django.contrib.auth.backends.ModelBackend'
			login(request, user)
			
			return HttpResponseRedirect('/start/?user_id=' + str(user.id))

	else:	 
			user_id = user.id
			# print 'else user_id', user_id
			return render_to_response('index.html', {'user_id':user_id} ,context_instance=RequestContext(request))


# def send_registration_confirmation(user):
# 	p = user.get_profile()
# 	title = "Evewat account confirmation"
# 	content = "http://localhost:8000/confirm/" + str(p.confirmation_code) + "/" + user.username
# 	send_templated_mail(
# 				template_name = 'welcome',
# 				subject = 'Welcome Evewat',
# 				from_email = 'testmail123sample@gmail.com',
# 				recipient_list = [user.email],
# 				context={
# 						 'user': user,
# 						 'content':content,
						 
# 				},
# 			)

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
				photosgroup=photosgroup  + 'events/static/img/' + str(uploaded_file)
			else:
				photosgroup=photosgroup  + 'events/static/img/' +str(uploaded_file) + ','
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
	return render_to_response("post_event.html", context_instance=RequestContext(request))


def subcategory_for_category(request):
	print "subcategory_for_category"
	if request.is_ajax() and request.GET and 'category_id' in request.GET:
		print request.GET['category_id']         
		objs1 = SubCategory.objects.filter(category__id=request.GET['category_id'])
		print 'objs', objs1
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
	postevent=Postevent.objects.get(pk=id)
	return render_to_response("company-profile.html",{'events':postevent}, context_instance=RequestContext(request))

def banner(request):
	return render_to_response("uploadbanner.html",context_instance=RequestContext(request))

# def store_payudetails(request):
# 	#Code for storing Payu Details
# 	payudetails=PayuDetails()
	
# 	payudetails.status=request.POST.get('status')
# 	payudetails.amount=request.POST.get('amount')
# 	payudetails.save()

# 	# response.set_cookie('payudetails',payudetails.id)
# 	# response.set_cookie('payustatus',payudetails.status)
# 	return payudetails.id,payudetails.status


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
	
	

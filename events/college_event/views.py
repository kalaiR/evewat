from django.shortcuts import render_to_response, redirect, render
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse
from events.models import *
from college_event.models import *
from college_event.views import *
# from events.forms import *
# from events.forms import UserForm
# from college_event.forms import EventSearchForm
from django.core.files import File
from django.contrib.auth.models import User

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

from django.contrib.auth.decorators import login_required
import random
import string
import datetime
# Create your views here.
def home(request):
	# banners=SiteBanner.objects.all()
	# print banners
	return render_to_response("index.html",context_instance=RequestContext(request))

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
			userprofile.user=user
			# print 'usr profile', userprofile.user
			userprofile.user_id=user.id
			# print 'usr profile user_id', userprofile.user_id	
			confirmation_code = ''.join(random.choice(string.ascii_uppercase + string.digits + string.ascii_lowercase) for x in range(33))
			# print confirmation_code
			p = Userprofile(user_id=userprofile.user_id, confirmation_code=confirmation_code)
			# print 'p', p
			p.save()			
			# send_registration_confirmation(user)
			registered = True
			user = User.objects.get(username=user.username)
			# print 'reg user', user
			user.backend='django.contrib.auth.backends.ModelBackend'
			login(request, user)
			return HttpResponseRedirect('/start/?user_id=' + str(user.id))

	else:	 
			user_id = user.id
			# print 'else user_id', user_id
			return render_to_response('index.html', {'user_id':user_id} ,context_instance=RequestContext(request))

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
	return render_to_response("post_event.html", context_instance=RequestContext(request))

def submit_event(request):
	# banner= SiteBanner()
	# banner.banner = request.FILES.get('image_file')
	# print "banner image", banner.banner
	# banner.save()
	if request.method=="POST":
		postevent=Postevent()
		postevent.name=request.POST['name']
		postevent.email=request.POST['email']
		postevent.mobile=request.POST['mobile']
		postevent.registrationfee=request.POST['registrationfees']
		postevent.poster=request.FILES.getlist('poster[]')
		# print "postevent.poster",postevent.poster
		def handle_uploaded_file(f):        	
			# print "settings.STATICFILES_DIRS", settings.STATICFILES_DIRS
			# print "f", f
			# print "f.name", f.name
			postevent.poster = open(settings.FOR_IMG + '%s' % f.name, 'wb+')
			# print "settings.FOR_IMG",settings.FOR_IMG 
			for chunk in f.chunks():
				postevent.poster.write(chunk)
			postevent.poster.close()
		photosgroup = ''
		
		count=len(postevent.poster)
		for uploaded_file in postevent.poster:
			count=count-1
			handle_uploaded_file(uploaded_file)
			if count==0:
				photosgroup=photosgroup  + settings.FOR_IMG + str(uploaded_file)
			else:
				photosgroup=photosgroup  + settings.FOR_IMG +str(uploaded_file) + ','
		# print photosgroup        
		postevent.poster=photosgroup
		postevent.contactperson=request.POST['queries']
		postevent.registrationurl=request.POST['festurl']
		postevent.festdescription=request.POST['festdescription']
		postevent.venuedescription=request.POST['reach']
		postevent.city=request.POST['city']
		postevent.festname=request.POST['festname']
		postevent.festcaption=request.POST['festcaption']
		# postevent.festtheme=request.POST['festtheme']
		postevent.festtype=request.POST['festtype']
		
		postevent.state=request.POST['state']
		postevent.startdate=request.POST['startdate']
		postevent.enddate=request.POST['enddate']
		postevent.deadline=request.POST['deadline']
		
		
		
		postevent.save()
		message="Your data succesfully submitted"
	return render_to_response("post_event.html",{'message':message}, context_instance=RequestContext(request))


def event(request,pname=None):
	postevent=Postevent.objects.filter(festtype=pname)
	return render_to_response("search-result.html",{'events':postevent,'pname':pname}, context_instance=RequestContext(request))

def details(request,id=None):
	postevent=Postevent.objects.get(pk=id)
	
	return render_to_response("company-profile.html",{'events':postevent}, context_instance=RequestContext(request))

def upload_banner(request):
	return render_to_response("uploadbanner.html",context_instance=RequestContext(request))

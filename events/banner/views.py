# Create your views here.
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


from django.contrib.auth.decorators import login_required
import random
import string
import datetime

class JSONResponse(HttpResponse):
	def __init__(self, data):
		super(JSONResponse, self).__init__(
				simplejson.dumps(data), mimetype='application/json')


def find_position(request):
	from django.utils.encoding import smart_unicode, force_unicode
	if request.is_ajax() and request.GET and 'path' in request.GET:
		if request.GET['path']== 'home':
			path='/'
		elif request.GET['path']== 'list':
			path='event/'
		else:
			path='details/'
		objs = BannerPrice.objects.filter(page=path)
		print "objs", objs
		return JSONResponse([{'id': o.id, 'name': smart_unicode(o.position)}
		for o in objs])
	else:
		return JSONResponse({'error': 'Not Ajax or no GET'})
#request.is_ajax() and
def find_price(request):
	from django.utils.encoding import smart_unicode, force_unicode
	if request.GET and 'path' and 'position' in request.GET:
		if request.GET['path']== 'home':
			path='/'
		elif request.GET['path']== 'list':
			path='event/'
		else:
			path='details/'
		filterargs = { 'page': path, 'position': request.GET['position'] }
		objs = BannerPrice.objects.filter( **filterargs)
		print "objs", objs
		return JSONResponse([{'id': o.id, 'name': smart_unicode(o.price)}
		for o in objs])
	else:
		return JSONResponse({'error': 'Not Ajax or no GET'})
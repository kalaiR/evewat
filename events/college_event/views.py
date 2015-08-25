from django.shortcuts import render_to_response, redirect, render
from django.template import RequestContext
from banner.models import *
# Create your views here.
def home(request):
	banners=SiteBanner.object.all()
	print banners
	return render_to_response("index.html",{'banners':banners},context_instance=RequestContext(request))


def post_event(request):
	return render_to_response("post_event.html", context_instance=RequestContext(request))


from django.shortcuts import render_to_response, redirect, render
from django.template import RequestContext

# Create your views here.
def home(request):
	return render_to_response("index.html", context_instance=RequestContext(request))


def post_event(request):
	return render_to_response("post_event.html", context_instance=RequestContext(request))


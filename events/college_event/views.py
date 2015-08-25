from django.shortcuts import render_to_response, redirect, render
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse
from college_event.models import *
from django.core.files import File

# Create your views here.
def home(request):
	return render_to_response("index.html", context_instance=RequestContext(request))

def post_event(request):
	return render_to_response("post_event.html", context_instance=RequestContext(request))

def submit_event(request):
	if request.method=="POST":
		postevent=Postevent()
		postevent.name=request.POST['name']
		postevent.email=request.POST['email']
		postevent.mobile=request.POST['mobile']
		postevent.festname=request.POST['festname']
		postevent.festcaption=request.POST['festcaption']
		postevent.festtheme=request.POST['festtheme']
		postevent.festtype=request.POST['festtype']
		postevent.collegename=request.POST['collegename']
		postevent.city=request.POST['city']
		postevent.state=request.POST['state']
		postevent.startdate=request.POST['startdate']
		postevent.enddate=request.POST['enddate']
		postevent.deadline=request.POST['deadline']
		postevent.registrationfee=request.POST['registrationfees']
		postevent.festdescription=request.POST['festdescription']
		postevent.festevent=request.POST['festevent']
		postevent.department=request.POST['department']
		postevent.festwebsite=request.POST['festwebsite']
		postevent.registrationurl=request.POST['festurl']
		postevent.collegeurl=request.POST['collegewebsite']
		postevent.facebook=request.POST['facebook']
		postevent.twitter=request.POST['twitter']
		postevent.youtube=request.POST['youtube']
		postevent.poster=request.FILES.get('poster')
		postevent.brochure=request.FILES.get('brochure')
		postevent.applink=request.POST['applink']
		postevent.venuedescription=request.POST['reach']
		postevent.contactperson=request.POST['queries']
		postevent.guest=request.POST['guest']
		postevent.festpronites=request.POST['pronites']
		postevent.sponsorship=request.POST['sponsorship']
		postevent.accommodation=request.POST['accommodation']
		postevent.attendees=request.POST['attendees']
		postevent.feedback=request.POST['feedback']
		postevent.sponsor=request.POST['sponsor']
		postevent.stalls=request.POST['stalls']
		postevent.save()
		message="Your data succesfully submitted"
	return render_to_response("post_event.html",{'message':message}, context_instance=RequestContext(request))


def event(request,pname=None):
	postevent=Postevent.objects.filter(festtype=pname)
	return render_to_response("search-result.html",{'events':postevent,'pname':pname}, context_instance=RequestContext(request))

def details(request,id=None):
	postevent=Postevent.objects.get(pk=id)
	print postevent.stalls
	return render_to_response("company-profile.html",{'events':postevent}, context_instance=RequestContext(request))

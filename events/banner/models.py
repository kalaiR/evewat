import datetime
from datetime import timedelta
from django.db import models
from college_event.extra import ContentTypeRestrictedFileField
from django import forms
from django.core.exceptions import ValidationError
from django.http import HttpResponseRedirect, HttpResponse
from django.contrib import messages

POSITION = (
    ('bottom', 'Bottom of the page'),
    ('left', 'Left of the page'),
    ('right', 'Right of the page'),
)

PAGEURL=(
    ('/','Home page'),
    ('event/','Listing page'),
    ('details/','Details page'),
)

class SiteBanner( models.Model ):   
    banner = ContentTypeRestrictedFileField(upload_to='static/banners',content_types=['image/jpeg','image/png'],max_upload_size=2097152,help_text="Please upload the banner Image with 2MB min and jpg, png format only allowed")
    link= models.CharField(max_length=200, null=True, blank=True, help_text="Please enter the website link")
    pageurl= models.CharField(max_length=50, choices=PAGEURL, help_text="Please select the page to display the banner")
    position=models.CharField(max_length=50, choices=POSITION, help_text="Please select the position to display the banner")
    price=models.FloatField(null=True, help_text="Please enter the price as INR")
    startdate= models.DateTimeField(default=datetime.datetime.now(),help_text="Startdate for banner") 
    enddate = models.DateTimeField(default=datetime.datetime.now()+timedelta(days=30),help_text="Enddate for banner") 
    duration=models.IntegerField(null=True, blank=True, help_text="No of days allowed")
    admin_status = models.BooleanField(default=False)

    def __unicode__(self):
        return self.link

    def save(self): 
        filterargs = { 'page': self.pageurl, 'position': self.position }
        try:
            result = BannerPrice.objects.get(**filterargs)
            self.price=result.price
            super(SiteBanner, self).save()
        except:
            return HttpResponseRedirect('/admin/banner/sitebanner/')

    
class BannerPrice(models.Model):
    page=models.CharField(max_length=50,choices=PAGEURL)
    position=models.CharField(max_length=50,choices=POSITION)
    price = models.FloatField(null=True, default=0.0)
    duration=models.IntegerField(null=True, blank=True,help_text="No of days allowed")

    class Meta:
        unique_together = [("page", "position")]

    def __unicode__(self):
        return self.position

class Mainbanner(models.Model):
    mainbanner = ContentTypeRestrictedFileField(upload_to='static/mainbanner',content_types=['image/jpeg','image/png'],max_upload_size=2097152,help_text="Please upload the Main banner Image with 2MB min and jpg, png format only allowed")
    price=models.FloatField(null=True, help_text="Please enter the price as INR")
    admin_status = models.BooleanField(default=False)


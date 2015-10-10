from django.contrib.auth.models import *
from django.db import models
from django.forms import ModelForm
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt
from PIL import Image
from django.utils import simplejson
from haystack.query import SearchQuerySet
from college_event.extra import ContentTypeRestrictedFileField

import simplejson as json
import os
from django.conf import settings

class Category(models.Model):
	name= models.CharField(max_length=150, unique=True)		
	def __unicode__(self):
		return self.name
		
class SubCategory(models.Model):
	category = models.ManyToManyField(Category)
	icon= models.ImageField(upload_to='subcategory/icon/',max_length=100) 
	hover_icon= models.ImageField(upload_to='subcategory/icon/',max_length=100) 
	name = models.CharField(max_length=50) 
	def __unicode__(self):
		return self.name

class City(models.Model):
	city=models.CharField(max_length=150, null=True)
	state=models.CharField(max_length=100, null=True)
	country_code=models.CharField(max_length=10, null=True, blank=True,default='IN')
	country_name=models.CharField(max_length=50, null=True, blank=True,default='india')
	def __unicode__(self):
		return self.city

class College(models.Model):
	collegetype=models.ForeignKey(Category,null=True)
	city=models.ForeignKey(City,null=True)
	college_name=models.CharField(max_length=150, null=True, blank=True)
	def __unicode__(self):
		return self.college_name

class Department(models.Model):
	department=models.CharField(max_length=150, null=True)
	def __unicode__(self):
		return self.department

class CollegeDepartment(models.Model):
	department=models.ForeignKey(Department, null=True)
	college=models.ManyToManyField(College,null=True)
	def __unicode__(self):
		return self.department.department

class PremiumPriceInfo(models.Model):
    premium_price = models.FloatField(null=True, default=0.0)
    currency=models.CharField(max_length=10)
    purpose=models.CharField(max_length=30)
    month=models.IntegerField(null=True, blank=True)
    def __unicode__(self):
        return self.purpose

class Organizer(models.Model):
	
	organizer_name= models.CharField(max_length=50)
	organizer_mobile= models.BigIntegerField()
	organizer_email=models.EmailField(max_length=50)

	def __unicode__(self):
		return self.organizer_name


class Postevent(models.Model):
	name= models.CharField(max_length=50, )
	email= models.EmailField(max_length=50,)
	mobile= models.BigIntegerField()
	event_title=models.CharField(max_length=50,)
	startdate= models.DateField(max_length=50,)
	enddate= models.DateField(max_length=50,)
	category= models.ForeignKey(Category,)	
	eventtype= models.ForeignKey(SubCategory,null=True, blank=True)	
	eventdescription= models.TextField()	
	address= models.TextField()
	organizer = models.ManyToManyField(Organizer)
	state= models.CharField(max_length=50,)
	city= models.CharField(max_length=50)
	college=models.CharField(max_length=50)
	department=models.CharField(max_length=50)
	poster = models.ImageField(upload_to='static/img/',null=True, max_length=500,help_text="Please upload the banner Image with 2MB min and jpg, png format only allowed")	
	admin_status = models.BooleanField(default=False)
	payment = models.BooleanField(default=False)

	def __unicode__(self):
		return self.event_title


class Feedback(models.Model):
	name= models.CharField(max_length=50, null=True)
	email= models.EmailField(max_length=50)
	comments= models.TextField()
	rating=models.IntegerField()
	
		

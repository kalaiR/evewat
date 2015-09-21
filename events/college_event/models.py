from django.contrib.auth.models import *
from django.db import models
from django.forms import ModelForm
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt
from PIL import Image
from django.utils import simplejson
from haystack.query import SearchQuerySet

import simplejson as json
import os
from django.conf import settings

class Category(models.Model):
	name= models.CharField(max_length=150, null=True, blank=True)		
	def __unicode__(self):
		return self.name
		
class SubCategory(models.Model):
	category = models.ManyToManyField(Category)
	icon= models.ImageField(upload_to='category_icon',max_length=100) 
	name = models.CharField(max_length=50) 
	def __unicode__(self):
		return self.name

    

class Country(models.Model):
	code=models.CharField(max_length=50)
	country=models.CharField(max_length=50)
	def __unicode__(self):
		return self.code

class City(models.Model):
	city=models.CharField(max_length=150, null=True, blank=True)
	country=models.ForeignKey(Country)
	def __unicode__(self):
		return self.city

class Location(models.Model):
	city=models.ForeignKey(City,null=True, blank=True)
	locality=models.CharField(max_length=150, null=True, blank=True)
	def __unicode__(self):
		return self.locality

# class Collegetype(models.Model):
# 	college_type=models.CharField(max_length=150, null=True, blank=True)
# 	def __unicode__(self):
# 		return self.college_type

class College(models.Model):
	collegetype=models.ForeignKey(Category,null=True)
	city=models.ForeignKey(City,null=True)
	location=models.ForeignKey(Location, null=True, blank=True)
	college_name=models.CharField(max_length=150, null=True, blank=True)
	def __unicode__(self):
		return self.college_name

# class Department(models.Model):
# 	college=models.ForeignKey(College,null=True)
# 	department=models.CharField(max_length=150, null=True, blank=True)
# 	def __unicode__(self):
# 		return self.department

class Department(models.Model):
	department=models.CharField(max_length=150, null=True, blank=True)
	def __unicode__(self):
		return self.department

class CollegeDepartment(models.Model):
	department=models.ForeignKey(Department, null=True, blank=True)
	college=models.ManyToManyField(College,null=True)
	def __unicode__(self):
		return self.department.department

# Create your models here.
class Postevent(models.Model):
	"""docstring for Postevent"""
	name= models.CharField(max_length=50, null=True, blank=True)
	email= models.EmailField(max_length=50, null=True, blank=True)
	mobile= models.BigIntegerField(null=True, blank=True)
	festname= models.CharField(max_length=50,null=True, blank=True)
	festcaption= models.CharField(max_length=50,null=True, blank=True)
	festtype= models.ForeignKey(SubCategory,null=True, blank=True)	
	city= models.ForeignKey(City,null=True, blank=True)
	state= models.CharField(max_length=50,null=True, blank=True)
	startdate= models.DateField(max_length=50,null=True, blank=True)
	enddate= models.DateField(max_length=50,null=True, blank=True)
	deadline= models.TextField(null=True, blank=True)
	registrationfee= models.TextField(null=True, blank=True)
	festdescription= models.TextField(null=True, blank=True)	
	registrationurl= models.URLField(max_length=250,null=True, blank=True)	
	poster = models.ImageField(upload_to='events/static/img/',null=True, max_length=500)	
	venuedescription= models.TextField(null=True, blank=True)
	contactperson= models.TextField(null=True, blank=True)
	admin_status = models.BooleanField(default=False)
	
	def __unicode__(self):
		return self.festname

class PremiumPriceInfo(models.Model):
    premium_price = models.FloatField(null=True, default=0.0)
    currency=models.CharField(max_length=10)
    purpose=models.CharField(max_length=30)
    month=models.IntegerField(null=True, blank=True)
    def __unicode__(self):
        return self.purpose

class Tempevent(models.Model):
	"""docstring for Tempevent"""
	name= models.CharField(max_length=50, null=True, blank=True)
	email= models.EmailField(max_length=50, null=True, blank=True)
	mobile= models.BigIntegerField(null=True, blank=True)
	festname= models.CharField(max_length=50,null=True, blank=True)
	festcaption= models.CharField(max_length=50,null=True, blank=True)
	festtype= models.ForeignKey(SubCategory,null=True, blank=True)	
	city= models.ForeignKey(City,null=True, blank=True)
	state= models.CharField(max_length=50,null=True, blank=True)
	startdate= models.DateField(max_length=50,null=True, blank=True)
	enddate= models.DateField(max_length=50,null=True, blank=True)
	deadline= models.TextField(null=True, blank=True)
	registrationfee= models.TextField(null=True, blank=True)
	festdescription= models.TextField(null=True, blank=True)	
	registrationurl= models.URLField(max_length=250,null=True, blank=True)	
	poster = models.ImageField(upload_to='events/static/img/',null=True, max_length=500)	
	venuedescription= models.TextField(null=True, blank=True)
	contactperson= models.TextField(null=True, blank=True)
	initial=models.CharField(max_length=50, null=True, blank=True)
	fname=models.CharField(max_length=50, null=True, blank=True)
	lname=models.CharField(max_length=50, null=True, blank=True)
	phoneno=models.BigIntegerField(null=True, blank=True)
	payu_mail= models.EmailField(max_length=50, null=True, blank=True)
	amount=models.BigIntegerField(null=True, blank=True)
	def __unicode__(self):
		return self.festname


		


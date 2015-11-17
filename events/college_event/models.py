from django.contrib.auth.models import *
from django.db import models
from django.forms import ModelForm
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt
from PIL import Image
from haystack.query import SearchQuerySet
from college_event.extra import ContentTypeRestrictedFileField
from datetime import datetime

import os
from django.conf import settings

SELECT = (
	('male','Male'),
	('female','Female'),
	)


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

class Postevent(models.Model):
	name= models.CharField(max_length=50)
	email= models.EmailField(max_length=50)
	mobile= models.CharField(max_length=50)
	event_title=models.CharField(max_length=50)
	startdate= models.DateField(max_length=50)
	enddate= models.DateField(max_length=50)
	category= models.ForeignKey(Category)	
	eventtype= models.ForeignKey(SubCategory,null=True, blank=True)	
	eventdescription= models.TextField()	
	address= models.TextField()
	state= models.CharField(max_length=50)
	city= models.CharField(max_length=50)
	college=models.CharField(max_length=50)
	department=models.CharField(max_length=50)
	poster = models.ImageField(upload_to='static/img/',null=True, max_length=500,help_text="Please upload the banner Image with 2MB min and jpg, png format only allowed")	
	admin_status = models.BooleanField(default=False)
	payment = models.BooleanField(default=False)
	status_isactive=models.BooleanField(default=False)
		
	def __unicode__(self):
		return self.event_title


class Organizer(models.Model):
	postevent=models.ForeignKey(Postevent)
	organizer_name= models.CharField(max_length=50)
	organizer_mobile= models.CharField(max_length=50)
	organizer_email=models.EmailField(max_length=50)
	def __unicode__(self):
		return self.organizer_name

class Feedback(models.Model):
	name= models.CharField(max_length=50, null=True)
	email= models.EmailField(max_length=50)
	comments= models.TextField()
	rating=models.IntegerField()
	
# class User_profile(models.Model):
# 	user = models.ForeignKey(User)
# 	last_name=models.CharField(max_length=50, null=True, blank=True)
# 	user_mobile= models.CharField(max_length=50, null=True, blank=True)
# 	gender = models.CharField(max_length=50, null=True, blank=True, choices=SELECT)
# 	Date_of_birth = models.DateField(null=True, blank=True) 
# 	user_address= models.TextField(null=True, blank=True)
# 	profile_pic = models.ImageField(upload_to='../media/static/img/',null=True, blank=True, max_length=500)		
	
		

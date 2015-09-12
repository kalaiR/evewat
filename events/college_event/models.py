from django.contrib.auth.models import *
from django.db import models
from django.forms import ModelForm
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt
from django.db import models
from PIL import Image
from django.utils import simplejson
from haystack.query import SearchQuerySet

# from college_event.search_indexes import PosteventIndex
import simplejson as json

class Category(models.Model):
	name= models.CharField(max_length=150, null=True, blank=True)	
	category_type = models.CharField(max_length=250)
	def __unicode__(self):
		return self.name
		
class SubCategory(models.Model):
	category = models.ForeignKey(Category)
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

class Collegetype(models.Model):
	college_type=models.CharField(max_length=150, null=True, blank=True)
	def __unicode__(self):
		return self.college_type

class College(models.Model):
	collegetype=models.ForeignKey(Collegetype,null=True)
	city=models.ForeignKey(City,null=True)
	location=models.ForeignKey(Location)
	college_name=models.CharField(max_length=150, null=True, blank=True)
	def __unicode__(self):
		return self.college_name

class Department(models.Model):
	college=models.ForeignKey(College,null=True)
	department=models.CharField(max_length=150, null=True, blank=True)
	def __unicode__(self):
		return self.department


# Create your models here.
class Postevent(models.Model):
	"""docstring for Postevent"""
	name= models.CharField(max_length=50, null=True, blank=True)
	email= models.EmailField(max_length=50, null=True, blank=True)
	mobile= models.BigIntegerField(null=True, blank=True)
	festname= models.CharField(max_length=50,null=True, blank=True)
	festcaption= models.CharField(max_length=50,null=True, blank=True)
	festtheme= models.CharField(max_length=50,null=True, blank=True)
	festtype= models.CharField(max_length=50,null=True, blank=True)
	collegename= models.CharField(max_length=150,null=True, blank=True)
	city= models.CharField(max_length=50,null=True, blank=True)
	state= models.CharField(max_length=50,null=True, blank=True)
	startdate= models.DateField(max_length=50,null=True, blank=True)
	enddate= models.DateField(max_length=50,null=True, blank=True)
	deadline= models.TextField(null=True, blank=True)
	registrationfee= models.TextField(null=True, blank=True)
	festdescription= models.TextField(null=True, blank=True)
	festevent= models.TextField(null=True, blank=True)
	department= models.CharField(max_length=50,null=True, blank=True)
	festwebsite= models.CharField(max_length=50,null=True, blank=True)
	registrationurl= models.URLField(max_length=250,null=True, blank=True)
	collegeurl= models.URLField(max_length=250,null=True, blank=True)
	facebook= models.URLField(max_length=250,null=True, blank=True)
	twitter= models.URLField(max_length=250,null=True, blank=True)
	youtube= models.URLField(max_length=250,null=True, blank=True)
	# poster= models.ImageField(upload_to='media/poster',max_length=100)
	poster = models.ImageField(upload_to='static/img/',null=True, max_length=500)
	brochure= models.ImageField(upload_to='media/brochure',max_length=100)
	applink= models.URLField(max_length=250,null=True, blank=True)
	venuedescription= models.TextField(null=True, blank=True)
	contactperson= models.TextField(null=True, blank=True)
	guest= models.TextField(null=True, blank=True)
	festpronites= models.TextField(null=True, blank=True)	
	sponsorship= models.TextField(null=True, blank=True)
	stalls= models.TextField(null=True, blank=True)
	sponsor= models.TextField(null=True, blank=True)
	accommodation= models.TextField(null=True, blank=True)
	attendees= models.BigIntegerField(null=True, blank=True)
	feedback= models.TextField(null=True, blank=True)
	def __unicode__(self):
		return self.name






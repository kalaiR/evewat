from django import template
from django.db.models import *
from college_event.models import *
from banner.models import *
from college_event.views import *
from django.contrib.gis.geoip import GeoIP
from events import globals
register = template.Library()

@register.filter
def get_banner(banner):
	banner=SiteBanner.objects.all()
	return banner

@register.filter
def get_city(request):
	user_ip = globals.ip
	if user_ip.startswith('127.0.0'):
		user_ip = ''
	g = GeoIP()
	current_city=g.city(user_ip)['city']
	print "current_city", current_city
	country = g.country_code(user_ip)
	country_id=Country.objects.get(code=country)      
	current_country_cities = City.objects.filter(country=country_id.id).exclude(city=current_city)
	return current_country_cities

@register.filter	
def get_current_city_from_cookie(request):
	print "get_current_city_from_cookie"
	result = get_global_city(request)
	return result

@register.filter
def get_categories(initial_load):  
	category=Category.objects.all()	
	return category

@register.filter
def get_subcategories(categoryId):  	
	subcategories = SubCategory.objects.filter(category_id=categoryId)		
	return subcategories	

@register.filter
def get_photos(photo): 
	photo=str(photo).split(',')
	return photo[0]


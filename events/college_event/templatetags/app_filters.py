from django import template
from django.db.models import *
from college_event.models import *
from banner.models import *
from college_event.views import *
from django.contrib.gis.geoip import GeoIP
from events import globals
from events.util import *
register = template.Library()

@register.filter
def get_banner(banner):
	banner=SiteBanner.objects.all()
	return banner

@register.filter
def get_city(request):
	user_ip = globals.ip
	# local
	if user_ip.startswith('127.0.0'):
		user_ip = '114.69.235.2'
	g = GeoIP()
	country = g.country_code(user_ip)
	current_city = get_global_city(request)
	current_country_cities = City.objects.filter(country_code=country)
	return current_country_cities

@register.filter	
def get_current_city_from_cookie(request):
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


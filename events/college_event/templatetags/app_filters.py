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
	locality =Location.objects.all()
	city=City.objects.all()
	country=Country.objects.all()
	user_ip = globals.ip
	g = GeoIP()
	current_city=g.city(user_ip)['city']
	print g.city(user_ip)
	code=g.country_code(user_ip)
	print "code1", code
	country_id=Country.objects.filter(code=g.country_code(user_ip))[0].id
	print "country_id1", country_id
	# current_country_cities=City.objects.filter(country_id=Country.objects.filter(code=g.country_code(user_ip))[0].id).exclude(city=current_city)
	current_country_cities=City.objects.filter(country_id=Country.objects.filter(code=g.country_code(user_ip))[0].id).exclude(city=current_city)
	print "current_country_cities1 before", current_country_cities
	# current_country_cities = [str(obj.city) for obj in current_country_cities]
	print "current_country_cities1 after", current_country_cities
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
# import os
import random
import string
import uuid
import urllib2
from django.conf import settings
from django.contrib.gis.geoip import GeoIP
from events import globals
# from ipware.ip import get_ip
from college_event.models import *
from django.contrib import admin

def get_client_ip(request):
	# x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
	# print "x_forwarded_for", x_forwarded_for
	# if x_forwarded_for:
	#     ip = x_forwarded_for.split(',')[0]
	#     print "x_forwarded_for ip", ip
	# else:
	#     ip = request.META.get('REMOTE_ADDR')
	#     print "remote ip", ip
	# return ip
	
	# x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
	# print "x_forwarded_for", x_forwarded_for
	# if x_forwarded_for:
	#     ip = x_forwarded_for.split(',')[-1].strip()
	# else:
	#     ip = request.META.get('REMOTE_ADDR')
	# return ip

	# ip = get_ip(request)
	# print "iware ip", ip
	# return ip

	# import ipgetter
	# IP = ipgetter.myip()
	# print "IP from ipgetter", IP
	# return IP 

	''' This utility gets client's IP address from the request
	'''
	print 'value==', request.META.get('HTTP_X_FORWARDED_FOR', request.META.get('REMOTE_ADDR', '127.0.0.1'))
	return request.META.get('HTTP_X_FORWARDED_FOR', request.META.get('REMOTE_ADDR', '127.0.0.1'))

def get_current_country_cities(request):
	user_ip = globals.ip
	# local
	if user_ip.startswith('127.0.0'):
		user_ip = '114.69.235.2'
	g = GeoIP()
	country = g.country_code(user_ip)
	print "country", country   
	current_country_cities = City.objects.filter(country_code=country)
	return current_country_cities


def get_global_country(request):
	""" This function get global language based on following assets
		
		1. authenticated user's language
		2. cookie
		2. fixido select language
		3. query string
		4. brower setting
		5. default sweden
	""" 
	user_ip = globals.ip
	# local
	if user_ip.startswith('127.0.0'):
		user_ip = '114.69.235.2'
	g = GeoIP()
	country = g.country_code(user_ip)
	# print "country", country
	return country

def get_global_city(request):
	""" This function get global language based on following assets
		
		1. authenticated user's language
		2. cookie
		2. fixido select language
		3. query string
		4. brower setting
		5. default sweden
	""" 
	user_ip = globals.ip
	print "user_ip from get_global_city in util", user_ip
	# local
	if user_ip.startswith('127.0.0'):
		user_ip = '114.69.235.2'
	g = GeoIP()
	print '123456789', g.city(user_ip)
	city=g.city(user_ip)['city']    
	print "city in util.py", city
	return city

def get_global_city_id(request):
		# if request.COOKIES.get('city'):
		#     city=City.objects.get(city=request.COOKIES.get('city'))
		#     city_id=city.id
		#     print "city_id", city_id
		#     return city_id
		# else:
		#     return None
	user_ip = globals.ip
	# local
	if user_ip.startswith('127.0.0'):
		user_ip = '114.69.235.2'
	g = GeoIP()
	city=g.city(user_ip)['city']
	print "city", city
	if not city:
		city = "Pondicherry" 
	if City.objects.filter(city=city).exists():
		city = City.objects.get(city=city)
		city_id=city.id
	else:
		country = get_global_country(request)
		city_model = City()
		city_model.city = city
		city_model.country_code = country
		city_model.country_name = g.country_name(user_ip)
		city_model.save()
		city_id = city_model.id
	print "city_id", city_id
	return city_id    


def format_redirect_url(redirect_path, query_string):
	''' utility to format redirect url with fixido query string
	'''
	stop_popup = True if 'st=' in query_string else False
	
	url_join_str = '?'
	if url_join_str in redirect_path:
		redirect_path, qs = redirect_path.split(url_join_str, 1)
		query_string = qs + '&' + query_string
	
	qs = {}
	for q in query_string.split('&'):
		if '=' in q:
			k, v = q.split('=', 1)
			qs[k] = v
	
	if stop_popup:
		if qs.has_key('zr'): del qs['zr']
		if qs.has_key('lr'): del qs['lr']
		if qs.has_key('ler'): del qs['ler']
		if qs.has_key('thanks'): del qs['thanks']
	
	query_string = ''
	for k in qs:
		query_string += k + '=' + qs[k] + '&'
		
	return redirect_path + url_join_str + query_string[:-1]

from django import template
from django.db.models import *
from banner.models import *
from college_event.views import *
from college_event.models import *
from events.util import *
register = template.Library()

@register.filter
def get_banner(banner):
	banner=SiteBanner.objects.all()
	return banner
	
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


from django import template
from django.db.models import *
from banner.models import *
from college_event.views import *
from college_event.models import *
from events.util import *
from django.template.defaultfilters import stringfilter
register = template.Library()

@register.filter
def get_main_banner(banner):
	banner=Mainbanner.objects.all()
	return banner

@register.filter
def get_banner(banner):
	banner=SiteBanner.objects.all()
	return banner
	
@register.filter
def get_categories(initial_load):  
	category=Category.objects.all().order_by('id')	
	return category

@register.filter
def get_subcategories(categoryId):  	
	print "get_subcategories"
	subcategories = SubCategory.objects.filter(category__id=categoryId)		
	print "subcategories", subcategories
	return subcategories	

@register.filter
def get_photos(photo): 
	photo=str(photo).split(',')
	return photo[0]

@register.filter
@stringfilter
def get_subcategoriesCount(subCategoryId, categoryId):
    subcategoriescounts = Postevent.objects.filter(category=categoryId,eventtype=subCategoryId, admin_status=1).count()
    return subcategoriescounts
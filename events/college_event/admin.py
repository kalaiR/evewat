from django.contrib import admin
from college_event.models import *

# Register your models here.
class CategoryAdmin(admin.ModelAdmin):
	fields=['name']
	list_display = ('id', 'name')
	list_filter = ['name']
	search_fields = ['id', 'name']    
	list_per_page = 50

class SubCategoryAdmin(admin.ModelAdmin):
	fields=['name', 'icon', 'category']
	list_display = ('id','name','icon')
	list_filter = ['name']
	search_fields = ['id', 'name']
	list_per_page = 50

class CityAdmin(admin.ModelAdmin):
	fields=['city','state']
	list_display = ('id', 'city','state')
	list_filter = ['city']
	search_fields = ['id', 'city']
	list_per_page = 50

# class LocationAdmin(admin.ModelAdmin):
# 	fields=['city','locality']
# 	list_display = ('id', 'locality')
# 	list_filter = ['locality']
# 	search_fields = ['id', 'locality']
# 	list_per_page = 50

# class CollegetypeAdmin(admin.ModelAdmin):
# 	fields=['college_type']
# 	list_display = ('id', 'college_type')
# 	list_filter = ['college_type']
# 	search_fields = ['id', 'college_type']
# 	list_per_page = 50

class CollegeAdmin(admin.ModelAdmin):
	fields=['collegetype','city','college_name']
	list_display = ('id','city', 'college_name')
	list_filter = ['college_name']
	search_fields = ['id', 'college_name']
	list_per_page = 50

class DepartmentAdmin(admin.ModelAdmin):
	fields=['department']
	list_display = ('id', 'department')
	list_filter = ['department']
	search_fields = ['id', 'department']
	list_per_page = 50

class PosteventAdmin(admin.ModelAdmin):
	filelds=['name','eventtype','city','event_title','startdate','admin_status']
	list_display = ('id', 'name','eventtype','city','event_title','startdate','admin_status')
	list_filter = ['id','event_title','city']	
	search_fields = ['id', 'event_title']
	list_per_page = 50

	def admin_status(self, obj):
		return obj.admin_status 
	admin_status.boolean = False

	def get_readonly_fields(self, request, obj=None):
		if obj: # editing an existing object
			return self.readonly_fields + ('payment',)
		return self.readonly_fields

class PosteventAdmin_v2(admin.ModelAdmin):
	filelds=['name','festtype','city','festname','registrationfee','startdate','admin_status']
	list_display = ('id', 'name','festtype','city','festname','registrationfee','startdate','admin_status')
	list_filter = ['id','festname','city']	
	search_fields = ['id', 'festname']
	list_per_page = 50

	def admin_status(self, obj):
		return obj.admin_status 
	admin_status.boolean = False


class PremiumPriceInfoAdmin(admin.ModelAdmin):
	fields=['premium_price','currency','purpose','month']
	list_display = ('premium_price','currency','purpose','month')
	list_filter = ['currency']
	search_fields = ['id', 'currency']
	list_per_page = 50
	
admin.site.register(Category, CategoryAdmin)
admin.site.register(City, CityAdmin)
admin.site.register(PremiumPriceInfo, PremiumPriceInfoAdmin)
# admin.site.register(Location, LocationAdmin)
# admin.site.register(Collegetype, CollegetypeAdmin)
admin.site.register(College, CollegeAdmin)
admin.site.register(Department, DepartmentAdmin)
admin.site.register(Postevent_v2, PosteventAdmin)    
admin.site.register(SubCategory, SubCategoryAdmin)   
admin.site.register(CollegeDepartment) 
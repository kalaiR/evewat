from django.contrib import admin
from college_event.models import *

# Register your models here.
class CategoryAdmin(admin.ModelAdmin):
    fields=['name','category_type']
    list_display = ('id', 'name','category_type')
    list_filter = ['name','category_type']
    search_fields = ['id', 'name']    
    list_per_page = 50

class SubCategoryAdmin(admin.ModelAdmin):
    fields=['category','name', 'icon']
    list_display = ('id', 'category','name','icon')
    list_filter = ['name']
    search_fields = ['id', 'name']
    list_per_page = 50

class CityAdmin(admin.ModelAdmin):
    fields=['city']
    list_display = ('id', 'city')
    list_filter = ['city']
    search_fields = ['id', 'city']
    list_per_page = 50

class LocationAdmin(admin.ModelAdmin):
	fields=['city','locality']
	list_display = ('id', 'locality')
	list_filter = ['locality']
	search_fields = ['id', 'locality']
	list_per_page = 50

class CollegetypeAdmin(admin.ModelAdmin):
	fields=['college_type']
	list_display = ('id', 'college_type')
	list_filter = ['college_type']
	search_fields = ['id', 'college_type']
	list_per_page = 50

class CollegeAdmin(admin.ModelAdmin):
	fields=['collegetype','city','location','college_name']
	list_display = ('id','city','location', 'college_name')
	list_filter = ['college_name']
	search_fields = ['id', 'college_name']
	list_per_page = 50

class DepartmentAdmin(admin.ModelAdmin):
	fields=['college','department']
	list_display = ('id', 'college','department')
	list_filter = ['department']
	search_fields = ['id', 'department']
	list_per_page = 50

	# class UserprofileAdmin(admin.ModelAdmin):
	# 	fields=['confirmation_code']
	# 	list_display = ('id', 'confirmation_code')
	# 	list_filter = ['id']
	# 	search_fields = ['id']
	# 	list_per_page = 50
# class UserprofileAdmin(admin.ModelAdmin):
#     fields=['user','city','mobile','confirmation_code']
#     list_display = ('id', 'user','city','mobile','confirmation_code' )
#     list_filter = ['city']
#     search_fields = ['id', 'mobile']
#     list_per_page = 50   

	# fields=['mobile','confirmation_code']
	# list_display = ('id', 'mobile','confirmation_code','city_id','location_id')
	# search_fields = ['id', 'mobile']
	

class PosteventAdmin(admin.ModelAdmin):
	list_display = ('id', 'name','festtype','city', 'collegename','department','festname','registrationfee','sponsor','startdate',)
	list_filter = ['id','festname','sponsor','city','collegename','department']	
	search_fields = ['id', 'festname']
	list_per_page = 50

# class EventtypeAdmin(admin.ModelAdmin):
#     fields=['icon','name','college_type']
#     list_display = ('id', 'icon','name','college_type')
#     list_filter = ['name','college_type']
#     search_fields = ['id', 'name']
#     list_per_page = 50
    
admin.site.register(Category, CategoryAdmin)
admin.site.register(City, CityAdmin)
admin.site.register(Location, LocationAdmin)
admin.site.register(Collegetype, CollegetypeAdmin)
admin.site.register(College, CollegeAdmin)
admin.site.register(Department, DepartmentAdmin)
admin.site.register(SubCategory, SubCategoryAdmin)
admin.site.register(Postevent, PosteventAdmin)    

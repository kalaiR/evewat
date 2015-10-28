from django.contrib import admin
from college_event.models import *


class CategoryAdmin(admin.ModelAdmin):
	fields=['name']
	list_display = ('id', 'name')
	list_filter = ['name']
	search_fields = ['id', 'name']    
	list_per_page = 50

class SubCategoryAdmin(admin.ModelAdmin):
	fields=['name', 'icon', 'category','hover_icon']
	list_display = ('id','name','icon','hover_icon')
	list_filter = ['name']
	search_fields = ['id', 'name']
	list_per_page = 50

class CityAdmin(admin.ModelAdmin):
	fields=['city','state']
	list_display = ('id', 'city','state')
	list_filter = ['city']
	search_fields = ['id', 'city']
	list_per_page = 50


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

class OraganizerInLine(admin.TabularInline):
    model = Organizer
    extra = 0

class PosteventAdmin(admin.ModelAdmin):

	filelds=['name','email','eventtype','city','event_title','startdate','admin_status']
	list_display = ('id', 'name','eventtype','city','event_title','startdate','admin_status')
	list_filter = ['id','event_title','city']	
	search_fields = ['id', 'event_title']
	list_per_page = 50
	actions = ['send_EMAIL']
	inlines = [ OraganizerInLine ]
	
	def admin_status(self, obj):
		return obj.admin_status 
	admin_status.boolean = False

	def send_EMAIL(self,request, queryset):
		from templated_email import send_templated_mail
		if self.admin_status.boolean == True :
			print 'admin_status', admin_status
			for i in queryset:
				if i.email:
					send_templated_mail(
							template_name = 'premium_user',
				            subject = 'Welcome Evewat',
				            from_email = 'eventswat@gmail.com',
				            recipient_list = [i.email],
				            context={
				                       'user': i.name,
				                    },
				        ) 
		

         	

	def get_readonly_fields(self, request, obj=None):
		if obj: # editing an existing object
			return self.readonly_fields + ('payment',)
		return self.readonly_fields

class OrganizerAdmin(admin.ModelAdmin):
	fields = ['organizer_name','organizer_mobile','organizer_email']
	list_display = ('organizer_name','organizer_mobile','organizer_email')
	list_filter = ['organizer_name']
	search_fields = ['organizer_name']
	list_per_page = 50
	actions = ['send_invitations']

	def send_invitations(self, request, queryset):
		from templated_email import send_templated_mail
		for i in queryset:
			if i.organizer_email:
				send_templated_mail(
						template_name = 'welcome',
			            subject = "Invitation",
			            from_email = 'eventswat@gmail.com',
			            recipient_list = [i.organizer_email],
			            context={
			                       'user': i.organizer_name,
			                    },
			        ) 



class PremiumPriceInfoAdmin(admin.ModelAdmin):
	fields=['premium_price','currency','purpose','month']
	list_display = ('premium_price','currency','purpose','month')
	list_filter = ['currency']
	search_fields = ['id', 'currency']
	list_per_page = 50

class FeedbackAdmin(admin.ModelAdmin):
	fields=['name','email','comments','rating']
	list_display = ('name','email','comments','rating')
	list_filter = ['name']
	search_fields = ['id', 'name']
	list_per_page = 50

# class OrganizerAdmin(admin.ModelAdmin):
# 	list_display = ('organizer_name','organizer_email','organizer_email')

admin.site.register(Category, CategoryAdmin)
admin.site.register(Feedback, FeedbackAdmin)
admin.site.register(City, CityAdmin)
admin.site.register(PremiumPriceInfo, PremiumPriceInfoAdmin)
admin.site.register(College, CollegeAdmin)
admin.site.register(Department, DepartmentAdmin)
admin.site.register(Postevent, PosteventAdmin)    
admin.site.register(SubCategory, SubCategoryAdmin)   
admin.site.register(Organizer, OrganizerAdmin)   
admin.site.register(CollegeDepartment) 
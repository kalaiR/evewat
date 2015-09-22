from django.contrib import admin
from banner.models import *

class SiteBannerAdmin(admin.ModelAdmin):
	fields=['banner','link', 'pageurl', 'position','price','admin_status']
	list_display = ('id', 'banner','link', 'pageurl', 'position','price','admin_status')
	list_filter = ['pageurl', 'position']
	search_fields = ['id', 'pageurl','position','price']    
	list_per_page = 50
	
	def admin_status(self, obj):
		return obj.admin_status 
	admin_status.boolean = False

admin.site.register(SiteBanner, SiteBannerAdmin)

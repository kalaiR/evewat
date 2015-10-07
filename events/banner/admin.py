from django.contrib import admin
from banner.models import *
import datetime as dt
import datetime

class SiteBannerAdmin(admin.ModelAdmin):
	fields=['banner','link', 'pageurl', 'position','price','admin_status','duration']
	list_display = ('id', 'banner','link', 'pageurl', 'position', 'price', 'duration', 'admin_status')
	list_filter = ['pageurl', 'position']
	search_fields = ['id', 'pageurl','position','price']    
	list_per_page = 50
	
	def admin_status(self, obj):
		return obj.admin_status 
	admin_status.boolean = False

class BannerPriceAdmin(admin.ModelAdmin):
	fields=['page','position', 'price', 'duration',]
	list_display = ('id', 'page','position', 'price', 'duration')
	list_filter = ['position', 'page']
	search_fields = ['id', 'position','page','price']    
	list_per_page = 50
	

admin.site.register(SiteBanner, SiteBannerAdmin)
admin.site.register(BannerPrice, BannerPriceAdmin)


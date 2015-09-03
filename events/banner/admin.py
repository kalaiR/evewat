from django.contrib import admin
from banner.models import *

class SiteBannerAdmin(admin.ModelAdmin):
    fields=['banner','link', 'pageurl', 'position','price']
    list_display = ('id', 'banner','link', 'pageurl', 'position','price')
    list_filter = ['pageurl', 'position']
    search_fields = ['id', 'pageurl','position','price']
    # readonly_fields =['id']
    list_per_page = 50

admin.site.register(SiteBanner, SiteBannerAdmin)

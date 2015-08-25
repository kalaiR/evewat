from django.contrib import admin
from banner.models import *

class SiteBannerAdmin(admin.ModelAdmin):
    fields=['banner','link', 'pageurl', 'position']
    list_display = ('id', 'banner','link', 'pageurl', 'position')
    list_filter = ['pageurl', 'position']
    search_fields = ['id', 'pageurl','position']
    # readonly_fields =['id']
    list_per_page = 50

admin.site.register(SiteBanner, SiteBannerAdmin)

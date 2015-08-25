from django.contrib import admin
from college_event.models import *
# Register your models here.
class EventtypeAdmin(admin.ModelAdmin):
    fields=['icon','name','college_type']
    list_display = ('id', 'icon','name','college_type')
    list_filter = ['name','college_type']
    search_fields = ['id', 'name']
    list_per_page = 50
    
admin.site.register(Eventtype, EventtypeAdmin)
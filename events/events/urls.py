from django.conf.urls import patterns, include, url
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from college_event.views import *
from college_event.models import *
from django.views.generic import RedirectView


#For loading global functions
from django.template.loader import add_to_builtins
add_to_builtins('college_event.templatetags.app_filters')

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^$', 'college_event.views.home', name='home'),
     # User login verfication
    url(r'^login/$', 'college_event.views.user_login', name='user_login'),
    url(r'^logout/$', 'college_event.views.logout_view', name='logout_view'),

    #registeration
    url(r'^register/$', 'college_event.views.register', name='register'),
    
     # getting tarted
    url(r'^start/$', 'college_event.views.start',name='start'),
    url(r'^post_event$', 'college_event.views.post_event', name='post_event'),
    url(r'^banner$', 'college_event.views.banner', name='banner'),
    url(r'^submit_event$', 'college_event.views.submit_event', name='submit_event'),
    url(r'^upload_banner$', 'college_event.views.upload_banner', name='upload_banner'),
    url(r'^(?i)event/(?P<pname>.*)/$', 'college_event.views.event',name='event'),
    url(r'^details/(?P<id>[0-9]+)/$','college_event.views.details',name='details'),
   

    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
)+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

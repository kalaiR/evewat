from django.conf.urls import patterns, include, url
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from college_event.views import *
from college_event.models import *
from django.views.generic import RedirectView
# from search.views import *

# Custom Search View
from search.eventsearch import EventSearchView
from search.searchform import EventSearchFilter


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
    
    # for registeration confirm
    url(r'^confirm/$', 'college_event.views.confirm', name='confirm'),

     # getting tarted
    url(r'^start/$', 'college_event.views.start',name='start'),
    url(r'^post_event$', 'college_event.views.post_event', name='post_event'),
    url(r'^post_event_v2$', 'college_event.views.post_event_v2', name='post_event_v2'),
    url(r'^banner$', 'college_event.views.banner', name='banner'),
    url(r'^submit_event$', 'college_event.views.submit_event', name='submit_event'),
    url(r'^submit_event_v2$', 'college_event.views.submit_event_v2', name='submit_event_v2'),
    url(r'^success_event$', 'college_event.views.success_event', name='success_event'),
    url(r'^upload_banner$', 'college_event.views.upload_banner', name='upload_banner'),
    url(r'^success$', 'college_event.views.success', name='success'),
    url(r'^(?i)event/(?P<pname>.*)/$', 'college_event.views.event',name='event'),
    url(r'^details/(?P<id>[0-9]+)/$','college_event.views.details',name='details'),
    # url(r'^payment_postevent$', 'college_event.views.payment_event', name='payment_event'),
    url(r'^payment/', 'payu.views.buy_order', name='payment'),
    url(r'^payment_event/', 'payu.views.paid_user', name='payment'),
    #getting subcategory
    url(r'^subcategory_for_category/$', 'college_event.views.subcategory_for_category',name='subcategory'),

    # Find event when ajax call
    url(r'^event_for_subcategory/$', 'college_event.views.event_for_subcategory',name='event'),

    # Search & Advance Search     
    url(r'^(?i)search/', EventSearchView(
      template='search-result.html', 
      form_class=EventSearchFilter, 
      #results_per_page=settings.SEARCH_PAGE_NUMBER_OF_LEADS
    ), name='newsearchPageV2'), 

    # url(r'^blog/', include('blog.urls')),

    url(r'^find_colleges/$', 'college_event.views.find_colleges',name='find_colleges'),
    url(r'^find_department/$', 'college_event.views.find_department',name='find_department'),
    url(r'^find_subcategory/$', 'college_event.views.find_subcategory',name='find_subcategory'),
    url(r'^find_city/$', 'college_event.views.find_city',name='find_city'),

    url(r'^admin/', include(admin.site.urls)),
)+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

from django.conf.urls import patterns, include, url
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from college_event.views import *
from college_event.models import *
from django.views.generic import RedirectView

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
	# url(r'^confirm/$', 'college_event.views.confirm', name='confirm'),
	# forget password
	url(r'^(?i)password_reset/$', 'django.contrib.auth.views.password_reset', {
	  'template_name':'registration/password_reset_form.html',
	  'email_template_name':'registration/password_reset_email.html'
	}, name="password_reset"),
	url(r'^(?i)user/password/reset/$', 
		'django.contrib.auth.views.password_reset', 
		{'post_reset_redirect' : '/user/password/reset/done/'}),
	url(r'^(?i)user/password/reset/done/$',
		'django.contrib.auth.views.password_reset_done'),
	url(r'^(?i)user/password/reset/(?P<uidb36>[0-9A-Za-z]+)-(?P<token>.+)/$', 
		'django.contrib.auth.views.password_reset_confirm', 
		{'post_reset_redirect' : '/user/password/done/'}),
	url(r'^(?i)user/password/done/$', 
		'django.contrib.auth.views.password_reset_complete'),
	 # getting tarted
	url(r'^start/$', 'college_event.views.start',name='start'),
	url(r'^post_event$', 'college_event.views.post_event', name='post_event'),    
	url(r'^banner$', 'college_event.views.banner', name='banner'),
	url(r'^submit_event_v2$', 'college_event.views.submit_event_v2', name='submit_event_v2'),
	url(r'^upload_banner$', 'college_event.views.upload_banner', name='upload_banner'),
	url(r'^success$', 'college_event.views.success', name='success'),
	url(r'^about$', 'college_event.views.about', name='about'),
	url(r'^feed$', 'college_event.views.feedback', name='feedback'),
	url(r'^privacy$', 'college_event.views.privacy', name='privacy'),
	url(r'^terms_and_conditions$', 'college_event.views.terms_and_conditions', name='terms_and_conditions'),
	url(r'^faqs$', 'college_event.views.faqs', name='faqs'),
	# url(r'^(?i)event/(?P<pname>.*)/$', 'college_event.views.event',name='event'),
	url(r'^details/(?P<id>[0-9]+)/$','college_event.views.details',name='details'),    
	url(r'^payment/', 'payu.views.buy_order', name='payment'),
	url(r'^payment_event/', 'payu.views.paid_user', name='payment'),
	#getting subcategory
	url(r'^subcategory_for_category/$', 'college_event.views.subcategory_for_category',name='subcategory'),
	url(r'^all_subcategory_for_category/$', 'college_event.views.all_subcategory_for_category',name='all_subcategory'),

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
	url(r'^find_position/$', 'banner.views.find_position',name='find_position'),
	url(r'^find_price/$', 'banner.views.find_price',name='find_price'),
	url(r'^getcity/$', 'college_event.views.getcity',name='getcity'),
	url(r'^getstate/$', 'college_event.views.getstate',name='getstate'),
	url(r'^getcollege/$', 'college_event.views.getcollege',name='getcollege'),
	url(r'^getdept/$', 'college_event.views.getdept',name='getdept'),
	url(r'^getcity_base/$', 'college_event.views.getcity_base',name='getcity_base'),

	url(r'^admin/', include(admin.site.urls)),
	url(r'^import/', 'college_event.views.importcollegedata', name='importcollegedata'),
	url('', include('social.apps.django_app.urls', namespace='social')),
   	url('', include('django.contrib.auth.urls', namespace='auth')),
   	url(r'^home_v2/$', 'college_event.views.home_v2', name='home_v2'),
)+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

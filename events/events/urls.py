from django.conf.urls import patterns, include, url
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^$', 'college_event.views.home', name='home'),
    url(r'^post_event$', 'college_event.views.post_event', name='post_event'),
    url(r'^submit_event$', 'college_event.views.submit_event', name='submit_event'),
    url(r'^(?i)event/(?P<pname>.*)/$', 'college_event.views.event',name='event'),
    url(r'^details/(?P<id>[0-9]+)/$','college_event.views.details',name='details'),

    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
)+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

from django import template
from banner.models import *
register = template.Library()

@register.filter
def get_banner(banner):
	banner=SiteBanner.objects.all()
	return banner
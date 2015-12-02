"""
WSGI config for events project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/howto/deployment/wsgi/
"""
import os
import sys

sys.path.append('/home/eventswat/events_dev/evewat/eventswat')
os.environ['DJANGO_SETTINGS_MODULE'] = 'eventswat.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()

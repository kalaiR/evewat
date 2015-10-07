# from core import helper
from events import globals
from django.conf import settings
from django.utils import translation
from events.util import get_client_ip
from events.util import *
from college_event.models import *

class User(Global):
    def __init__(self, *args, **kwargs):
        import warnings
        warnings.warn(
            DeprecationWarning,
            stacklevel=2
        )
        super(User, self).__init__(*args, **kwargs)
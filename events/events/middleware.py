# from core import helper
from events import globals
from django.conf import settings
from django.utils import translation
# from events.util import get_client_ip
from events.util import *
from college_event.models import *

#Middleware class for finding global_lanugage, global_country, global_ip when user enter into the website
class Global(object):
    # global_language = ''
    global_country=''
    # global_ip=''
    global_city=''
    global_city_id=''
    
    def process_request(self, request):
        # print "enter process_request"
        globals.request = request
        globals.user = getattr(request, 'user', None)
        # globals.ip = get_client_ip(request)
        # print "globals,ip", globals.ip
        # if ',' in globals.ip:
        #     globals.ip = globals.ip.split(',')[0].strip()
            print "globals.ip1", globals.ip
        globals.sess = request.session.session_key
        print 'globals.sess', globals.sess
        self.global_country=get_global_country(request)
        print 'self.global_country', self.global_country
        # self.global_city=get_global_city(request)
        # self.global_city_id=get_global_city_id(request)
        # self.global_ip= globals.ip
        # if request.user.is_authenticated():
        #     try:
        #         request.user.last_login = helper.get_now()
        #         request.user.save()
        #     except Exception, e:
        #         pass
    
    def process_response(self, request, response):
        """while response set cookie for language"""
        # print "self.global_language", self.global_language
        # print "self.global_country", self.global_country
        # print "self.global_ip", self.global_ip
        # print "self.global_city", self.global_city
        # if self.global_language:
        #     # print "enter self.global_language"
        #     language=self.global_language
        #     response.set_cookie(settings.LANGUAGE_COOKIE_NAME, 
        #         language, max_age = 365 * 24 * 60 * 60)        

        if self.global_country:
            print "enter self.global_country"
            country=self.global_country
            response.set_cookie("country", 
                country, max_age = 365 * 24 * 60 * 60)

        # if self.global_ip:
        #     # print "enter self.global_ip"
        #     ip=self.global_ip
        #     response.set_cookie("ip", 
        #         ip, max_age = 365 * 24 * 60 * 60)
        
        # if self.global_city:
        #     print "enter self.global_city"
        #     city=self.global_city
        #     response.set_cookie("city", 
        #         city, max_age = 365 * 24 * 60 * 60)

        # if self.global_city_id:
        #     print "enter self.global_city_id"
        #     city=self.global_city_id
        #     response.set_cookie("global_city_id", 
        #         city, max_age = 365 * 24 * 60 * 60)
            
        return response

class User(Global):
    def __init__(self, *args, **kwargs):
        import warnings
        warnings.warn(
            DeprecationWarning,
            stacklevel=2
        )
        super(User, self).__init__(*args, **kwargs)

# class END_USER_IP(Global):
#     def __init__(self, *args, **kwargs):
#         import warnings
#         warnings.warn(
#             DeprecationWarning,
#             stacklevel=2
#         )
#         super(END_USER_IP, self).__init__(*args, **kwargs)

# class END_USER_SESS(Global):
#     def __init__(self, *args, **kwargs):
#         import warnings
#         warnings.warn(
#             DeprecationWarning,
#             stacklevel=2
#         )
#         super(END_USER_SESS, self).__init__(*args, **kwargs)
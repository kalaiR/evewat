import datetime
from haystack.indexes import *
from models import Postevent
from django.contrib.auth.models import User
from haystack.management.commands import update_index
from django.template import RequestContext

class PosteventIndex(SearchIndex, Indexable):  
    text = CharField(document=True, use_template=True)
    searchtext = CharField()
    category = CharField(model_attr='category__id')
    eventtype = CharField(model_attr='eventtype__id')
    city = CharField(model_attr='city')    
    eventtitle = CharField(model_attr='event_title')
    payment=CharField(model_attr='payment')
    
    def autoUpdateRebuild_index(self):
        update_index.Command().handle()
        rebuild_index.Command().handle()

    def prepare_searchtext(self, obj):
        text = []
        if obj.event_title:
            text.append(obj.event_title)
        if obj.city:
            text.append(obj.city)
                    
        search = []
        for t in text:
            t = re.sub(r'[^\w]', ' ', t, flags=re.UNICODE).split(' ')
            for q in t:
                if q and (not re.match(r'[^\w]', q, flags=re.UNICODE)):
                    search.append(q)
        return ' '.join(search)
    
    def get_model(self):
        return Postevent
    
    def index_queryset(self, **kwargs):
        postevent = Postevent.objects.all()       
        return postevent
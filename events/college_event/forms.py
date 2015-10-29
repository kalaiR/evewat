from django import forms
from college_event.models import *
from college_event.admin import *
from college_event.forms import *
from haystack.forms import SearchForm
import pprint

class EventSearchForm(SearchForm):
    def no_query_found(self):
        return self.searchqueryset.all()

class UploadFileForm(forms.Form):
    title = forms.CharField(max_length=50, required=False)
    file  = forms.FileField()        

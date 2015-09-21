import re
from django import forms
from collections import OrderedDict
from college_event.models import *
from haystack.forms import SearchForm, FacetedSearchForm
from datetime import datetime
from django.http import HttpResponse, Http404
from search.searchresults import searchresults as eventsearch
from haystack.query import SearchQuerySet
from haystack.inputs import Clean, Raw, AutoQuery, Exact
from haystack.query import SQ
from college_event.models import Postevent

class Partial(Clean):
	input_type_name = 'partial'
	post_process = True

	def __init__(self, query_string, **kwargs):
		self.original = query_string
		super(Partial, self).__init__(query_string, **kwargs)

	def prepare(self, query_obj):
		# query_string = super(Partial, self).prepare(query_obj)
		query_string = query_string.lower()
		query_string = re.sub( '\s+', '* ', query_string).strip()

		if query_string[-1] != '*':
		  query_string = query_string + u'*'

		print "Searching", self.original, query_string
		return 
		
class EventSearchFilter(FacetedSearchForm):
		model = None
		print 'EventSearchFilter'
		fesstype = forms.CharField(required=False)		
		city = forms.CharField(required=False)		
		festname = forms.CharField(required=False)	
		category = forms.CharField(required=False)
		subcategory = forms.CharField(required=False)
		
		# lang = forms.CharField(required=False)
		# groupby = forms.CharField(required=False)
		
		def no_query_found(self):
			print 'no_query_found'  
			data = self.searchqueryset.all()  
				
			if hasattr(self, 'cleaned_data'):
					save_object = None
			 
			return data

		def get_default_filters(self):
			print 'get_default_filters' 
			sqs = SearchQuerySet().all()
			sqs = sqs.models(Postevent)
			print 'sqs',sqs			
			return sqs
	
		def get_default_search_field(self):
			print 'get_default_search_field'			
			return 'searchtext'

		def get_model_class(self):
			print 'get_model_class'
			return Postevent

		def search(self):
			print 'searchv2'
			
			if not hasattr(self, 'cleaned_data'):
				return eventsearch(model_cls=self.get_model_class(), 
					default_filters=self.get_default_filters())						
				
			_params = [
				# 'locality',      
				'festtype',   
				'city',
				'festname',			
				'subcategory',
				'category',
			]
			params = OrderedDict()
			print 'params', params
			for p in _params:
				if p in self.cleaned_data and self.cleaned_data[p]:
					params[p] =  self.cleaned_data[p]
				else:
					params[p] =  None
	 
			if params['subcategory']:
				params['subcategory'] = params['subcategory']
				print "params['subcategory']", params['subcategory']

			if params['city']:
				params['city'] = params['city']
				print "params['city']", params['city']

			# if params['subcategoryid']:
			# 	params['subcategoryid'] = params['subcategoryid']
			# 	print "params['subcategoryid']", params['subcategoryid']				

			

			q = self.cleaned_data['q'] if 'q' in self.cleaned_data else None
			print 'q self', q
			# groupby = None
			print 'q', q	

			return eventsearch(q, params, model_cls=self.get_model_class(), default_filters=self.get_default_filters(), default_search_field=self.get_default_search_field())


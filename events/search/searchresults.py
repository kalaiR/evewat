"""
Module to handle all search related tasks 
"""
import re
from collections import OrderedDict

from haystack.query import SearchQuerySet
# from haystack.utils.geo import Point, D
from haystack.inputs import Clean, Raw
from haystack.query import SQ


default_param_mappings = OrderedDict(
  #FieldName = Form Variable
  # locality = 'locality__in', 
  festtype = 'festtype__id',
  city = 'city__id',  
  festname = 'festname',
  # subcategory = 'subcategory__id',
  # category = 'category__id'
  )

default_geo_params = {
  'method': 'bydistance',
  'radius': 20
}

# default_orderby_mappings = {
#   # 'createddate': '-created',
#   # 'modifieddate': '-modified',
#   'pricelow': 'price',
#   'pricehigh': '-price',
#   'ispremium': '-ispremium'
# }

default_event_filters = {
  'active': 1,
  'status': 'active',
  }

replace_regex = r'[/:]'
ignore_regex = r'[^\w^,]'
tokenizer_regex = re.compile(r'[,]', flags=re.UNICODE)

def tokenize(query, double_check=True):
  tokens = tokenizer_regex.split(query)
  return [q.strip() for q in tokens if q]

  # tokens = re.sub(tokenizer_regex, ' ', query, 
  #     flags=re.UNICODE).split(' ')
  # if double_check:
  #   tokens = [q for q in tokens \
  #     if q and (not re.match(tokenizer_regex, q, flags=re.UNICODE))]

  # return tokens

def prepare_search_query(query, search_field='searchtext'):
  print "prepare_search_query", search_field
  query = query or ''
  qs = None

  query = re.sub(replace_regex, ' ', query, flags=re.UNICODE)
  tokens = tokenize(query)

  if tokens:
    cleand = Clean(query)
    qs = SQ(**{search_field:cleand})
    qs = qs | SQ(**{search_field + '__startswith': cleand})
    if len(tokens) > 1:
      for q in tokens:
        qs = qs | SQ(**{search_field:Clean(q)})
        qs = qs | SQ(**{search_field + '__startswith': Clean(q)})

  return qs


def searchresults(q=None, params=None, 
  geo_location=None, geo_params=None, geo_orderby='distance', 
  model_cls=None, default_filters=None, param_mappings=None,
  default_search_field='searchtext'):

  """Perform search leads using haystack"""
  print 'Eventsearch as Search'
  if not model_cls:
    model_cls = Postevent

  if params is None:
    params = OrderedDict([('festtype', None), ('city', None), ('festname', None), ('category', None), ('subcategory', None)])   

 
  
       
  
  # if orderby is None:
  #   # orderby = 'created'  
  #    orderby = '-ispremium'

  
  # if geo_params is None:
  #   geo_params = default_geo_params

  # if default_filters is None:
  #   default_filters = default_lead_filters

  mappings = param_mappings or default_param_mappings

  sqs = SearchQuerySet().all()
  if q:
    print 'q1 in result', q
    qs = prepare_search_query(q, default_search_field)
    if qs:
      print 'qs in result', qs
      sqs = SearchQuerySet().filter(qs)
      print 'qs in resulted sqs', sqs
     
  sqs = sqs.models(model_cls)
  
  if params:
    sq_params = OrderedDict()
    for given_param, search_param in mappings.iteritems():      
      if has(params, given_param):
        sq_params[search_param] =  params[given_param]
    
    
  if sq_params:
    print 'sqs in result', sqs
    sqs = sqs.filter(**sq_params)
    print "sqs with params", sqs

  # if orderby:
  #   sqs = sqs.order_by(orderby)

  # if groupby:
  #   sqs = sqs.facet(groupby)

 

  if geo_location:

    if isinstance(geo_location, (str, unicode)):
      country = geo_location
    elif isinstance(geo_location, (list, tuple)):
      country = geo_location      
    else:
      location = geo_location

    if geo_params['method'] == 'bydistance':
      radius = D(km=geo_params['radius'])
      
      sqs = sqs.dwithin('geolocation', country, radius)\
        .distance('geolocation', country)

    if geo_orderby:
      sqs = sqs.order_by('distance')

  print "Created query", unicode(sqs.query), geo_location, geo_params
  print "Created query", sqs
  return sqs

def has(dictobj, key):
  return (key in dictobj) and dictobj[key]
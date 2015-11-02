import logging
import time
import traceback
import operator
from datetime import datetime, timedelta
from models import *
from django.conf import settings
from django.contrib.sites.models import Site
from advertisement.models import *
# from freealert import *
from templated_email import send_templated_mail
from core import helper
from django.shortcuts import render_to_response, render, redirect
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse
# from actors import globals as glb #couldn't work w/o request
from django.utils.encoding import smart_str
class WorkerBase(object):

  def __init__(self, worker):
    self.worker = worker

  def create_tasks(self):
    pass

  def prepare(self):
    pass

  def runtasks(self, tasks):
    pass

  def finish(self):
    pass



class EmailNotification_ExpiredAds(WorkerBase):


  def create_tasks(self):    
    print "create_tasks"
    now  = helper.get_now() 
    product=Product.objects.all()

    for products in product:
      user_id = str(products.userprofile.user_id)
      user=str(products.userprofile.user.username)
      product_id = str(products.id)
      cat=str(products.category.name)
      subcat=str(products.subcategory.name)
      brand=str(products.ad_brand.brand_name)
      title=str(products.title)
      print "cat",cat
      print subcat
      print brand
      print title
      print "user",user
      print "user_id", user_id
      print "product_id", product_id
      result=(products.expired_date -  products.created_date).days
      print "result", result
      remaining_days = 30 - result
      if result >=25 and result < 30:       
        subject="Your " + str(products.title) + " ads will be expired in " + repr(remaining_days) + " days"
        content="If u want 10 more days to be active your ads please click the link http://localhost:8000/expired_ad_conformation/?" +"user_id=" + user_id + "&ad_id=" + product_id + ", otherwise if you want to remove ads please click this link http://localhost:8000/expired_ad_conformation/?" +"user_id=" + user_id + "&ad_id=" + product_id 
        con=content
        print "con",con
      elif result == 30:
        products.expired_date = products.expired_date + datetime.timedelta(days=10)       
        subject="Your " + str(products.title) + " ads is expired"
        content="If u want 10 more days to be active your ads please click the link http://localhost:8000"               
        con1=content
        print "con1" ,con1    
      elif result == 40:
          subject = "Your " + str(products.title) + " ads is expired after some extra period"
          content= "Hi...Your ad is going to be inactive, Click the blow link and Please make your ad as Premium http://localhost:8000"
      products.status_isactive = False      
      print "subject", subject
      print "content", content
      # content= "Hi.... these products are matched for your given request.please refer our website. Thank you"
      # print content
      ctx={'cat':cat,'subcat':subcat ,'brand':brand,'title':title,'con':con,'user':user}
        # check(self,context)
        
        # return check(context)
      
      self.sendmail(title, content, products.you_email,ctx)
      products.save()
    # if ProductExpiredAdTracking.objects.filter(product=product_id):
    #     expiredadtracking=ProductExpiredAdTracking.objects.get(product=product_id)
    # else:
    #     expiredadtracking =ProductExpiredAdTracking()
    #     expiredadtracking.product=Product.objects.get(id=product_id) 
    #     expiredadtracking.email_sent_count +=1 
    #     expiredadtracking.last_email_sent=now
    #     expiredadtracking.save()
      
  
  def runtasks(self, tasks):
    print "runtasks"

  def sendmail(self, title, content, email,ctx):
    # send_mail(title, content, 'testmail123sample@gmail.com', [email], fail_silently=False)
    # context={
    #        'cat' : "cat",
    #        'subcat':"subcat",
    #        'brand':"brand",
    #        'title':"title",
           
    #       }
      current_site = Site.objects.get(id=1),
      send_templated_mail(
             template_name = 'productmatch',
             subject = "subject",
             from_email = 'testmail123sample@gmail.com',
             recipient_list = [email],

             context = ctx,
        )

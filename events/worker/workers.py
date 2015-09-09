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

class EmailNotificationWorker(WorkerBase):

  # def create_tasks(self):
  #   print 'create_task'
  #   pass    

  # def runtasks(self, tasks):
  #   print 'runtask'
  #   freealert=FreeAlert.objects.all()
  #   usertracking=UserTracking()

  #   now=helper.get_now()
  #   for freealerts in freealert:
  #       alert_filter = Product.objects.filter(category=freealerts.alert_category, subcategory=freealerts.alert_subcategory,ad_brand=freealerts.alert_brand,city=freealerts.alert_city)
  #       for alert_filters in alert_filter:   
  #         usertrack=UserTracking.objects.get(track_user=alert_filters.userprofile.id)    
  #         if usertrack:
  #           usertrack.email_sent_count +=1
  #           usertrack.last_email_sent=now
  #           usertrack.save()
  #         else:
  #           usertracking.track_user=alert_filters.userprofile
  #           usertracking.email_sent_count +=1
  #           usertracking.last_email_sent=now
  #           usertracking.save()
  #         title = alert_filters.title
  #         content = "http://localhost:8000/postad/"
  #         print content
  #         ctx={'content':content}
  #         # content = "http://localhost:8000/confirm/" + str(p.confirmation_code) + "/" + user.username
  #         # send_mail(title, content, 'testmail123sample@gmail.com', [freealerts.alert_email], fail_silently=False)
  #         # self.sendmail(title, content, freealerts.alert_email,ctx)
  #         # send_templated_mail(
  #         #    template_name = 'alert',
  #         #    subject = "Alert Products",
  #         #    from_email = 'testmail123sample@gmail.com',
  #         #    recipient_list = [freealerts.alert_email],
  #         #    content = ctx,
  #         #   )
  #         send_templated_mail(
  #             template_name = 'alert',
  #             from_email = 'testmail123sample@gmail.com',
  #             recipient_list= [freealerts.alert_email],
  #             current_site = Site.objects.get(id=1),
  #             context = {
  #                'subject': 'Alert Products',
  #                'content':content,
  #                'cate':cate,
  #                'current_site':current_site,
  #                },
  #           )
  #         # print "mail sent successfully"

  def create_tasks(self):    
    print "create_tasks1"
    workertask=WorkerTask.objects.get(worker=self.worker)
    workertask.status='init'
    workertask.save()   
    print "self.worker", self.worker.id
    tasks = WorkerTask.objects.filter(worker=self.worker, status='init')
    print "tasks", tasks
    for task in tasks:
      print "task.worker", task.worker
    # config = NoticeEmailConfig.objects.get(pk='default')
    if tasks.count():
      print "Got tasks", tasks.count()
    for task in tasks:
      try:
        now  = helper.get_now()
        if self.worker.wait_for_approval:
          now = now + timedelta(seconds = self.worker.wait_for_approval)
        task.scheduled = now
        task.status = 'scheduled'
        task.save()

        # logging.debug("scheduled Lead for notice email : " + ntask.product.title)
      except Exception, e:
        logging.critical(e)
        traceback.print_exc()
        task.status = 'failed'
        task.notes = "Error while creating task " + traceback.format_exc()
        task.save() 
   
  def runtasks(self, tasks):
    print "runtasks1"
    freealert=FreeAlert.objects.all()   
    for task in tasks:
      now = helper.get_now()
      task.status = 'started'
      task.started = now
      task.save()
      try:
        now  = helper.get_now()
        yesterday = now - timedelta(seconds=5)
        # yesterday = now - timedelta(hours=24)
        print "task", task

        for freealerts in freealert:   
          if freealerts.last_email_sent!= datetime.datetime.now().time():  
          # if freealerts.last_email_sent!= datetime.date.today():    
            alert_filter = Product.objects.filter(category=freealerts.alert_category, subcategory=freealerts.alert_subcategory,ad_brand=freealerts.alert_brand,city=freealerts.alert_city)             
            product=[]
            for alert_filters in alert_filter:
              if UserTracking.objects.filter(track_alert=freealerts.id):
                print "enter if"
                usertrack= UserTracking.objects.get(track_alert=freealerts.id)    
                usertrack.email_sent_count +=1              
                usertrack.last_email_sent=now
                usertrack.save()
              else:
                print "enter else"
                print "freealerts.id", freealerts.id
                usertracking=UserTracking()
                usertracking.track_alert=FreeAlert.objects.get(id=freealerts.id)
                usertracking.email_sent_count +=1            
                usertracking.last_email_sent=now
                usertracking.save()
              title = alert_filters.title
              content = "http://localhost:8000/ads/" + str(alert_filters.id)
              print content
              print freealerts.alert_email
              cate= freealerts.alert_category.name
              print "cate",cate
              
              current_site = Site.objects.get(id=1)
              print "current_site",current_site
              # content = "http://localhost:8000/confirm/" + str(p.confirmation_code) + "/" + user.username
              # send_mail(title, content, 'testmail123sample@gmail.com', [freealerts.alert_email], fail_silently=False)
              # self.sendmail(title, content, freealerts.alert_email,ctx)
              send_templated_mail(
                  template_name = 'alert',
                  from_email = 'testmail123sample@gmail.com',
                  recipient_list= [freealerts.alert_email],
                  context = {
                     'subject': 'Alert Products',
                     'content':content,
                     'cate':cate,
                     'current_site':current_site,
                     
                  },
                )
              print "mail sent successfully"

              task.status = 'completed'
              task.completed = helper.get_now()
              task.save()
              
              product.append(smart_str(alert_filters.id))
              print "product", product         
            
            freealerts.mail_is_sent=True
            freealerts.last_email_sent=now
            freealerts.save()
            
            if WorkerNoticeEmailTask.objects.get(created_alert=freealerts.id):    
              ntask=WorkerNoticeEmailTask.objects.get(created_alert=freealerts.id)      
            else:
              ntask=WorkerNoticeEmailTask()
              ntask.task=task
              ntask.created_alert=FreeAlert.objects.get(id=freealerts.id)          
              ntask.tracking_code=helper.randomkey(26)
              ntask.iteration_count+=1
              ntask.mailissent = 1
              ntask.last_email_sent=now
              ntask.save()
              ntask.product = product

          else:
            print "cron again occur as today's date"

      except Exception, e:
        logging.critical(e)
        traceback.print_exc()
        task.status = 'failed'
        task.notes = "Error while running task " + traceback.format_exc()
        task.save()

  # def sendmail(self, title, content, email,ctx):

  #       send_templated_mail(
  #            template_name = 'alert',
  #            subject = "Alert Products",
  #            from_email = 'testmail123sample@gmail.com',
  #            recipient_list = [email],
  #            content = ctx,
  #       )

class EmailNotification_ExpiredAds(WorkerBase):

  # def check(self,request,ctx):

  #   print "123"
  #   return render_to_response('templated_email/productmatch.html',{'ctx':ctx}, context_instance=RequestContext(request))


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

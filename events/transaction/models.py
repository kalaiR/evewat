from django.db import models
from payu.models import *

# class Order(models.Model):
    
#     position=models.CharField(max_length=50, null=True, blank=True)
#     price=models.FloatField(max_length=50, null=True, blank=True)
#     amount=models.FloatField(default=0.0,null=True,blank=True)
    
#     created_date=models.DateTimeField(default=datetime.datetime.now)

#     def __unicode__(self):
#         return self.id



class Transaction(models.Model):
    payu_details=models.ForeignKey(PayuDetails)
    #Common
    payu_status=models.CharField(max_length=20, null=True, blank=True)
    created_date=models.DateTimeField(default=datetime.datetime.now)

    def __unicode__(self):
        return self.id

from django.db import models
from payu.models import *
from events.models import *

class Order(models.Model):
	# userprofile=models.ForeignKey(Userprofile)
	position=models.CharField(max_length=50, null=True, blank=True)
	price=models.FloatField(max_length=50, null=True, blank=True)
	banner=models.CharField(max_length=50, null=True, blank=True)
	# amount=models.FloatField(default=0.0,null=True,blank=True)
	
	created_date=models.DateTimeField(default=datetime.datetime.now)

	def __unicode__(self):
		return self.id



class Transaction(models.Model):
	# order=models.ForeignKey(Order)
	# payu_details=models.ForeignKey(PayuDetails)
   	payu_status=models.CharField(max_length=20, null=True, blank=True)
	created_date=models.DateTimeField(default=datetime.datetime.now)

	def __unicode__(self):
		return self.id

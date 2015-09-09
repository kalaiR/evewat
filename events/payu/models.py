from django.db import models
from uuid import uuid4
from uuid import UUID
import uuid
from django_extensions.db.fields import UUIDField
from college_event.models import *
import datetime

class PayuDetails(models.Model):
    mihpayid = models.CharField(max_length=100, null=True, blank=True)
    userprofile=models.ForeignKey(Userprofile)
    mode = models.CharField(max_length=10, null=True, blank=True)
    status = models.CharField(max_length=20, null=True, blank=True)
    unmappedstatus =models.CharField(max_length=20, null=True, blank=True)
    key =models.CharField(max_length=50, null=True, blank=True)
    txnid=models.CharField(max_length=50, null=True, blank=True)
    amount =models.FloatField(default=0.0,null=True, blank=True)
    cardCategory=models.CharField(max_length=20, null=True, blank=True)
    discount =models.FloatField(default=0.0,null=True, blank=True)
    net_amount_debit=models.FloatField(default=0.0,null=True, blank=True)
    addedon=models.DateTimeField(default=datetime.datetime.now)
    productinfo=models.CharField(max_length=500, null=True, blank=True)
    hash=models.CharField(max_length=250, null=True, blank=True)
    payment_source =models.CharField(max_length=20, null=True, blank=True)
    PG_TYPE=models.CharField(max_length=20, null=True, blank=True)
    bank_ref_num=models.CharField(max_length=50, null=True, blank=True)
    bankcode= models.CharField(max_length=20, null=True, blank=True)
    error=models.CharField(max_length=20, null=True, blank=True)
    error_Message =models.CharField(max_length=100, null=True, blank=True)
    name_on_card =models.CharField(max_length=50, null=True, blank=True)
    cardnum=models.CharField(max_length=20, null=True, blank=True)
    issuing_bank=models.CharField(max_length=50, null=True, blank=True)
    card_type =models.CharField(max_length=20, null=True, blank=True)

    def __unicode__(self):
        return self.mihpayid








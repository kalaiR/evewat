from django.db import models
from payu.models import *

class Transaction(models.Model):
    payu_details=models.ForeignKey(PayuDetails)
    #Common
    payu_status=models.CharField(max_length=20, null=True, blank=True)
    created_date=models.DateTimeField(default=datetime.datetime.now)

    def __unicode__(self):
        return self.id

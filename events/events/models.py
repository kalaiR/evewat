from django.contrib.auth.models import User
from django.db import models
from college_event.models import *


#Model for storing user personal details
class Userprofile(models.Model):
    # This line is required. Links UserProfile to a User model instance.
    user = models.OneToOneField(User)
    # The additional attributes we wish to include.
    # website = models.URLField(blank=True)
    # picture = models.ImageField(upload_to='static/img/', blank=True)

    # city=models.CharField(max_length=50, null=True, blank=True)
    city=models.ForeignKey('college_event.City', null=True, blank=True)

    mobile=models.CharField(max_length=50)
    confirmation_code=models.CharField(max_length=500)
    is_subscribed=models.BooleanField(default=False)
    # country=models.ForeignKey('college_event.Country',null=True, blank=True)
    # language=models.CharField(max_length=5)
    # address=models.OneToOneField(Address)
    # age_status=models.BooleanField(default=False)
    is_emailverified=models.BooleanField(default=False)
    ad_count=models.IntegerField(max_length=5, null=True, blank=True)

    # Override the __unicode__() method to return out something meaningful!
    def __unicode__(self):
        return self.user.username      
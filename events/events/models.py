from django.contrib.auth.models import User
from django.db import models
from events.models import *
from college_event.models import *


SELECT = (
    ('male','Male'),
    ('female','Female'),
    )


#Model for storing user personal details
class Userprofile(models.Model):
    # This line is required. Links UserProfile to a User model instance.
    user = models.OneToOneField(User)
    city=models.ForeignKey('college_event.City', null=True, blank=True)
    mobile=models.CharField(max_length=50)
    confirmation_code=models.CharField(max_length=500, blank=True)
    is_subscribed=models.BooleanField(default=False)
    is_emailverified=models.BooleanField(default=False)
    lastname=models.CharField(max_length=50, null=True, blank=True)
    city=models.ForeignKey(City,null=True, blank=True)
    college=models.ForeignKey(College, null=True, blank=True)
    department=models.ForeignKey(Department, null=True, blank=True)
    gender = models.CharField(max_length=50, null=True, blank=True, choices=SELECT)
    Date_of_birth = models.DateField(null=True, blank=True) 
    user_address= models.TextField(null=True, blank=True)
    profile_pic = models.ImageField(upload_to='/static/img/',null=True, blank=True, max_length=500)     
    
    # Override the __unicode__() method to return out something meaningful!
    def __unicode__(self):
        return self.user.username      
from django.db import models
POSITION = (
    ('top', 'Top'),
    ('bottom', 'Bottom'),
    ('left', 'Left'),
    ('right', 'Right'), 
    ('bleft', 'Background-left'),
    ('bright', 'Background-right'),
)

class SiteBanner( models.Model ):
   # banner = models.FileField(upload_to = 'static/banners/img', null=True, blank=True)
   banner = models.ImageField(upload_to='static/banners/img',null=True, blank=True)
   link= models.CharField(max_length=200, null=True, blank=True)
   pageurl= models.CharField(max_length=50, null=True, blank=True)
   position=models.CharField(max_length=50, null=True, blank=True, choices=POSITION)
   price=models.FloatField(max_length=50, null=True, blank=True)
   def __unicode__(self):
    return self.link

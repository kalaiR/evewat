from django.db import models
POSITION = (
    ('top', 'Top'),
    ('bottom', 'Bottom'),
    ('left', 'Left'),
    ('right', 'Right'), 
    ('bleft', 'Background-left'),
    ('bright', 'Background-right'),
)
PAGEURL=(
    ('/','HOME'),
    ('event/','Listing page'),
    ('details/','Details page'),
  )
class SiteBanner( models.Model ):
   # banner = models.FileField(upload_to = 'static/banners/img', null=True, blank=True)
   banner = models.ImageField(upload_to='static/banners', null=True, blank=True)
   link= models.CharField(max_length=200, null=True, blank=True)
   pageurl= models.CharField(max_length=50, null=True, blank=True, choices=PAGEURL)
   position=models.CharField(max_length=50, null=True, blank=True, choices=POSITION)
   price=models.FloatField(null=True, blank=True)
   admin_status = models.BooleanField(default=False) 
   duration=models.IntegerField(null=True, blank=True,help_text="No of days")  
   def __unicode__(self):
    return self.link
    
class BannerPrice(models.Model):
    page=models.CharField(max_length=50,choices=PAGEURL)
    position=models.CharField(max_length=50,choices=POSITION)
    price = models.FloatField(null=True, default=0.0)
    duration=models.IntegerField(null=True, blank=True,help_text="No of days")
    def __unicode__(self):
        return self.position
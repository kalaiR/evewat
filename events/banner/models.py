from django.db import models

POSITION = (
    ('top', 'Top of the page'),
    ('bottom', 'Bottom of the page'),
    ('left', 'Left of the page'),
    ('right', 'Right of the page'),
)

PAGEURL=(
    ('/','Home page'),
    ('event/','Listing page'),
    ('details/','Details page'),
)

class SiteBanner( models.Model ):   
   banner = models.ImageField(upload_to='static/banners', help_text="Please upload the banner Image with 2MB min and jpg, png format only allowed")
   link= models.CharField(max_length=200, null=True, blank=True, help_text="Please enter the website link")
   pageurl= models.CharField(max_length=50, choices=PAGEURL, help_text="Please select the page to display the banner")
   position=models.CharField(max_length=50, choices=POSITION, help_text="Please select the position to display the banner")
   price=models.FloatField(null=True, help_text="Please enter the price as INR")
   admin_status = models.BooleanField(default=False)
   # startdate_on = models.DateTimeField(auto_now=False, auto_now_add=True, help_text="Startdate for banner") 
   # enddate_on = models.DateTimeField(help_text="Enddate for banner") 
   duration=models.IntegerField(null=True, blank=True, help_text="No of days allowed")  
   def __unicode__(self):
    return self.link
    
class BannerPrice(models.Model):
    page=models.CharField(max_length=50,choices=PAGEURL)
    position=models.CharField(max_length=50,choices=POSITION)
    price = models.FloatField(null=True, default=0.0)
    duration=models.IntegerField(null=True, blank=True,help_text="No of days allowed")

    def __unicode__(self):
        return self.position
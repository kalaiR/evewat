from college_event.models import *

def globalactivity(request):
    subcategory=SubCategory.objects.all()
    recentad = Postevent.objects.filter(admin_status='true').order_by('-id')[:4]
    path = request.path
    return {'subcategory':subcategory,'recentad':recentad,'path':path}
from college_event.models import SubCategory

def eventtype(request):    
    subcategory=SubCategory.objects.all()
    return {'subcategory':subcategory}
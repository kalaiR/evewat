
def eventtype(request):
    from college_event.models import SubCategory
    subcategory=SubCategory.objects.all()
    return {'subcategory':subcategory}
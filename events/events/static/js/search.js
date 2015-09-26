/*
 * Advance Search - Brands autoload 
 */


function perform_search(){ 
           
            var q = $('#form_search_filter').serialize();
          
        
                    $.get('/search/?'+ q, function(data){                                                                                             
                    $('#search_result').html(data);
                    // attach_pagination_events();       

                });
            }


function attach_pagination_events(){
    // pagination_filter_align();
            $('[data-ajaxlink=true]').click(function(ele){
            $("html, body").animate({ scrollTop: 0 }, "slow");
            $('[name=page]').val($(ele.currentTarget).attr('data-ajaxpage'));          
            // perform_search();
            return false;
            });
            
}

$(document).ready(function() { 
    $('.search-btn').click(function() {
        validateSearch();
  });

    
    function fill_subcategories(category_id) {     
    // alert("catid"+category_id);
    $.getJSON("/subcategory_for_category/", {category_id: category_id},
      function(ret, textStatus) {
         // alert('category_id1'+ret);
        var options = '';       
        for (var i in ret) {
          options += "<div class='col-md-3 col-sm-4 col-xs-6 '><div class='category-item' id='search_result'><a  class='event_click' href='/search/?q=&subcategoryid=" + ret[i].id +"'>" + ret[i].name +"</a> </div></div>";

          }
             
        $(".subcategories").html(options);
      });
  }
  function fill_all_subcategories() {
  $.getJSON("/all_subcategory_for_category/",function(ret) {
        var options = '';       
        for (var i in ret) {
          options += "<div class='col-md-3 col-sm-4 col-xs-6 '><div class='category-item' id='search_result'><a  class='event_click' href='/search/?q=&subcategoryid=" + ret[i].id +"'>" + ret[i].name +"</a> </div></div>";

          }
             
        $(".subcategories").html(options);
      });
  }
    $('.select_category').click(function () {   
        var category = $(this).text();
        // alert('category'+ category);
        var catid =  $(this).next('.ajax_catid').val();
        // alert('catid'+ catid);
        fill_subcategories(catid);
        var trim_catid = $.trim(catid);
        var ajax_catid = $('input[type="hidden"]#categoryid').val(trim_catid);
        $('[name=categoryid]').val(trim_catid);        
        
      
    });

    $('.select_all_category').click(function () {  
      
      fill_all_subcategories();

    });

    
    $('#festtype').click(function(){
        // alert($(this).val());
        $('input[name="festtype"]').val($(this).val());
      });   

         
  


    // city based search     
    // $( ".city" ).change(function () {
    //   alert('city');
    //   var selected_option = $( ".city option:selected" ).val();
    //   alert(selected_option);
    //   $('p#cityselected').html($( ".city option:selected" ).text());  
    //   var city = $('input[type="hidden"]#city').val($(this).val());
    //   perform_search();
    // });  

    // $(".category_choose").change(function () {
    //   // var selected_category = $( ".category_choose option:selected" ).val();
    //   alert('selected_category');
    // });




function validateSearch() { 
   var is_search_page = window.location.href.indexOf('/search');
   // alert("is_search_page"+is_search_page);
   var q = $('#f_search').serialize();
   
   if(is_search_page > 1)
   {
      // alert("if");
   		$('[name=q]').val($('#q').val());
		  perform_search();
   }
   else
   {
        // alert("else");
       	if($('#q').val() == ''){

	         $('#q').val('');
    	}	
    	$("#f_search").submit();
   }
    //return true;
}
});

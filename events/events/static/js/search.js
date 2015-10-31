/*
 * Advance Search - Brands autoload 
 */


function perform_search(){ 
                // alert("perform_search");
                var q = $('#form_search_filter').serialize();
                // alert("q===>"+q);
                $.get('/ajax_search/?'+ q, function(data){  
                  // alert(data);                                                                                           
                  $('#search_result').html(data);
                  attach_pagination_events();       
                });
}

function attach_pagination_events(){
    // pagination_filter_align();
            $('[data-ajaxlink=true]').click(function(ele){
              // alert("yes");
            $("html, body").animate({ scrollTop: 0 }, "slow");
            $('[name=page]').val($(ele.currentTarget).attr('data-ajaxpage'));          
            perform_search();
            return false;
            });      
}

// $(window).load(function(){
// perform_search();
// });

$(document).ready(function() { 
    $('.search-btn').click(function() {
        //old code
        // validateSearch();

        //newly added by kalai
        q=$('form[name="f_search"] #q').val();
        city=$('form[name="f_search"] #fitltercitytxt').val();
        eventtype = $('form[name="f_search"] [name=eventtype]').val();
        $('[name=q]').val(q);
        $('[name=city]').val(city);
        $('[name=eventtype]').val(eventtype);
        $('[name=page]').val('');
        perform_search();
    });

    //newly added by kalai
    if (window.location.pathname == '/')
      perform_search();

    function fill_subcategories(category_id) {     
    // alert("catid"+category_id);
    $.getJSON("/subcategory_for_category/", {category_id: category_id},
      function(ret, textStatus) {
         // alert('category_id1'+ret);
        var options = '';       
        for (var i in ret) {
          options += "<div class='col-md-3 col-sm-4 col-xs-6 '><div class='category-item'><img class='sub_cat_icon' src='../media/" + ret[i].icon + "'><img class='sub_cat_icon_hover' src='../media/" + ret[i].hover_icon + "'><a  class='event_click' id=" + ret[i].id +"'>" + ret[i].name +"</a> </div></div>";

          }
             
        $(".subcategories").html(options);
      });
  }

  function fill_all_subcategories() {
  $.getJSON("/all_subcategory_for_category/",function(ret) {
        var options = '';       
        for (var i in ret) {
          options += "<div class='col-md-3 col-sm-4 col-xs-6 '><div class='category-item'><img class='sub_cat_icon' src='../media/" + ret[i].icon + "'><img class='sub_cat_icon_hover' src='../media/" + ret[i].hover_icon + "'><a  class='event_click' id=" + ret[i].id +"'>" + ret[i].name +"</a> </div></div>";

          }
             
        $(".subcategories").html(options);
      });
  }
 
    $(".category-item").bind('click', function (){
      alert("eventtype");
      var eventtype= $(this).find('a').attr('id');
      alert(eventtype);
      $('input[type="hidden"]#eventtype_id').val(eventtype);
      // $('[name=eventtype]').val(eventtype);  
      $('#f_search').submit().val(eventtype);
    });

    $('.select_category_index').click(function () {   

       //old code
       // alert("select_category");
       // var category = $(this).text();
       // // alert('category'+ category);
       // var catid =  $(this).next('.ajax_catid').val();
       // // alert('catid'+ catid);
       // fill_subcategories(catid);
       // var trim_catid = $.trim(catid);
       // var ajax_catid = $('input[type="hidden"]#categoryid').val(trim_catid);
       // $('[name=categoryid]').val(trim_catid);

       //newly updated by kalai 
       $(this).children('ul .subcategory_list').show();
       $(this).siblings('li').children('ul .subcategory_list').hide();
       var catid =  $(this).children('.ajax_catid').val();
       var trim_catid = $.trim(catid);
       $('[name=category]').val(trim_catid);
       $('[name=q]').val('');
       $('[name=eventtype]').val('');
       $('[name=page]').val('');
       $('[name=city]').val('');
       perform_search();
    });

    //newly added by kalai
    $('.subcategory_list_link').click(function () {   
       var subcatid =  $(this).children('.ajax_subcatid').val();
       var trim_subcatid = $.trim(subcatid);
       $('[name=eventtype]').val(trim_subcatid);
       $('[name=page]').val('');
       perform_search();
    });

    //newly added by kalai
    $('.category-search .select-clone li').click(function(ev){
      $('[name=eventtype]').val($(this).attr('data-value'));
    });

    $('.select_all_category').click(function () {     
      fill_all_subcategories();
    });

    $('#festtype').click(function(){
        // alert($(this).val());
        $('input[name="festtype"]').val($(this).val());
    });   


//old code
// function validateSearch() { 
//    var is_search_page = window.location.href.indexOf('/search');
//    // alert("is_search_page"+is_search_page);
//    var q = $('#f_search').serialize();
   
//    if(is_search_page > 1)
//    {
//       // alert("if");
//       $('[name=q]').val($('#q').val());
//       perform_search();
//    }
//    else
//    {
//         // alert("else");
//         if($('#q').val() == ''){

//            $('#q').val('');
//       } 
//       $("#f_search").submit();
//    }
//     //return true;
// }

});

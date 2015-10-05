(function($) {
  "use strict";
  $.cookie.raw = true;
  var $body = $('body');
  // var $head = $('head');
  // var $mainWrapper = $('#main-wrapper');

  // Mediaqueries
  // ---------------------------------------------------------
  // var XS = window.matchMedia('(max-width:767px)');
  // var SM = window.matchMedia('(min-width:768px) and (max-width:991px)');
  // var MD = window.matchMedia('(min-width:992px) and (max-width:1199px)');
  // var LG = window.matchMedia('(min-width:1200px)');
  // var XXS = window.matchMedia('(max-width:480px)');
  // var SM_XS = window.matchMedia('(max-width:991px)');
  // var LG_MD = window.matchMedia('(min-width:992px)');


  // jquery ui call functionfor calendar
  //------------------------------------------------
  $( ".startdate" ).datepicker({ format: 'dd-mm-yyyy'});
  $( ".enddate" ).datepicker({ format: 'dd-mm-yyyy'});
  // for date picker

  var nowTemp = new Date();
  var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

  var checkin = $('#dpd1').datepicker({
    onRender: function(date) {
      return date.valueOf() < now.valueOf() ? 'disabled' : '';
  }
  }).on('changeDate', function(ev) {
  if (ev.date.valueOf() > checkout.date.valueOf()) {
    var newDate = new Date(ev.date)
    newDate.setDate(newDate.getDate() + 1);
    checkout.setValue(newDate);
  }
  checkin.hide();
  $('#dpd2')[0].focus();
  }).data('datepicker');
var checkout = $('#dpd2').datepicker({
  onRender: function(date) {
    return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
  }
}).on('changeDate', function(ev) {
  checkout.hide();
}).data('datepicker');
  // Touch
  // ---------------------------------------------------------
  var dragging = false;

  $body.on('touchmove', function() {
    dragging = true;
  });

  $body.on('touchstart', function() {
    dragging = false;
  });


  // Advanced search toggle
  var $SearchToggle = $('.header-search-bar .search-toggle');
  $SearchToggle.hide();

  $('.header-search-bar .toggle-btn').on('click', function(e){
    e.preventDefault();
    $SearchToggle.slideToggle(300);
  });


  // navbar toggle
  //------------------------------------------------
  $('.header-nav-bar button').on('click',function(){
    $('.header-nav-bar').toggleClass('active');
  });

  var $headerNavBar = $('#header .header-nav-bar, .header-nav-bar button');

  $headerNavBar.each(function () {
    var $this = $(this);

    $this.on('clickoutside touchendoutside', function () {
      if ($this.hasClass('active')) { $this.removeClass('active'); }
    });
  });

  $('input[type=file]').simpleFilePreview();

  // Category toggle
  //-------------------------------------------------

  $('.category-toggle button').on('click',function(){
    $('.category-toggle').toggleClass('active');
  });

  var $CategoryTtoggle = $('.category-toggle');

  $CategoryTtoggle.each(function () {
    var $this = $(this);

    $this.on('clickoutside touchendoutside', function () {
      if ($this.hasClass('active')) { $this.removeClass('active'); }
    });
  });





  //home slide tab-content hide
  //---------------------------------------
  $('.home-tab li > a').on('click', function(){

    $CategoryTtoggle.removeClass('active');
  });

  // home map tab-content hide
  //---------------------------------------------
  $('.accordion-tab li > div a').on('click', function(){

    $CategoryTtoggle.removeClass('active');
  });


  // our-partners slider customize
  //-----------------------------------------
  $("#partners-slider").owlCarousel({
    autoPlay: 3000,
    items : 3,
    itemsDesktop : [1199,4],
    itemsDesktopSmall : [979,3],
    itemsTablet: [600,2]
  });




  //   function find_position(path){
  //     $.get('/find_position/', { path: path }, function(data) {
  //     $('.position_required').html($('<option>').text("Select Position").attr('value', "position_required"));
  //     //$(".position_required").siblings('.select-clone').html($('<li>').text("Select Position").attr('data-value', "position_required"));
  
  //     $.each(data, function(key,value) {
  //       $('.position_required').append($('<option>').text(value.name).attr('value', value.name));
  //       $(".position_required").siblings('.select-clone').append($('<li>').text(value.name).attr('data-value', value.name));
  //     });
  //     });
  //   }
  //   function find_price(position,path){
  //     $.get('/find_price/', { position: position,path: path }, function(data) {
  //     //$(".price_required").siblings('.select-clone').html($('<li>').text("Select Position").attr('data-value', "price_required"));
  //     $.each(data, function(key,value) {
  //       //$('.price_required').append($('<option>').text(value.name).attr('value', value.name));
  //       //$(".price_required").siblings('.select-clone').append($('<li>').text(value.name).attr('data-value', value.id));
  //       $(".price_required").val(value.name);
  //       $('.banner_price_act').text('Amount: '+value.name)
  //     });
  //     });
  //   }

  //   function find_city(state){
  //     $.get('/find_city/', { state: state }, function(data) {
  //     $('.select_city').html($('<option>').text("Select City"));
  //     $(".select_city").siblings('.select-clone').html($('<li>').text("Select City").attr('data-value', "select_city"));
  //     $.each(data, function(key,value) {
  //       $('.select_city').append($('<option>').text(value.name).attr('value', value.id));
  //       $(".select_city").siblings('.select-clone').append($('<li>').text(value.name).attr('data-value', value.id));
  //     });
  //     });
  //   }


  //  function find_colleges(city_id){
  //     $.get('/find_colleges/', { city_id: city_id }, function(data) {
  //     $('.select_college').html($('<option>').text("Select College"));
  //     $(".select_college").siblings('.select-clone').html($('<li>').text("Select College").attr('data-value', "select_college"));
  //     $.each(data, function(key,value) {
  //       $('.select_college').append($('<option>').text(value.name).attr('value', value.id));
  //       $(".select_college").siblings('.select-clone').append($('<li>').text(value.name).attr('data-value', value.id));
  //     });
  //     });
  //   }


  //  function find_department(college_id){
  //     $.get('/find_department/', { college_id: college_id }, function(data) {
  //     $('.select_dept').html($('<option>').text("Select Department"));
  //     $(".select_dept").siblings('.select-clone').html($('<li>').text("Select Department").attr('data-value', "select_department"));
  //     $.each(data, function(key,value) {
  //       $('.select_dept').append($('<option>').text(value.name).attr('value', value.name));
  //       $(".select_dept").siblings('.select-clone').append($('<li>').text(value.name).attr('data-value', value.name));
  //     });
  //     });
  //   }

  //   function find_subcategory(category_id){
  //     $.get('/find_subcategory/', { category_id: category_id }, function(data) {
  //     $('.select_subcategory').html($('<option>').text("Event Subcategory").attr('value', "select_subcategory"));
  //     $(".select_subcategory").siblings('.select-clone').html($('<li>').text("Event Subcategory").attr('data-value', "select_subcategory"));
  //     $.each(data, function(key,value) {
  //       $('.select_subcategory').append($('<option>').text(value.name).attr('value', value.id));
  //       $(".select_subcategory").siblings('.select-clone').append($('<li>').text(value.name).attr('data-value', value.id));
  //     });
  //     });
  //   }

  // // UOU Selects
  // // ---------------------------------------------------------
  // $.fn.uouCustomSelect = function () {

  //   var $select = $(this);

  //   $select.wrap('<div class="uou-custom-select"></div>');

  //   var $container = $select.parent('.uou-custom-select');

  //   $container.append('<ul class="select-clone"></ul>');

  //   var $list = $container.children('.select-clone'),
  //     placeholder = $select.data('placeholder') ? $select.data('placeholder') : $select.find('option:eq(0)').text();

  //   // $('<input class="value-holder" type="text" disabled="disabled" placeholder="' + placeholder + '"><i class="fa fa-chevron-down"></i>').insertBefore($list);
  //   $('<input class="value-holder" type="hidden" disabled="disabled" placeholder="' + placeholder + '"><span class="placeholder">' + placeholder + '</span><i class="fa fa-chevron-down"></i>').insertBefore($list);

  //   var $valueHolder = $container.children('.value-holder');
  //   var $valuePlaceholder = $container.children('.placeholder');

  //   // Create clone list
  //   $select.find('option').each(function () {
  //     var $this = $(this);

  //     $list.append('<li data-value="' + $this.val() + '">' + $this.text() + '</li>');
  //   });

  //   // Toggle list
  //   $container.on('click', function () {
  //     // console.log('click ' + $container);
  //     $container.toggleClass('active');
  //     $list.slideToggle(250);
  //   });

  //   // Option Select
  //  $list.delegate('li','click', function () {
  //     var $this = $(this);
  //     var id_value = $this.attr('data-value');     
  //     $valueHolder.val(id_value);
  //     $valuePlaceholder.html($this.text());
  //     // $(input.valueHolder).parent().next('input[type="hidden"]#subcategoryid').val(id_value);
  //     $select.find('option[value="' + $this.data('value') + '"]').prop('selected', true);
  //     // if ($this.parent('select-clone').siblings('select').hasClass('select_city'))
  //     if ($this.parents().children().hasClass('select_city'))
  //     { 
        
  //       if ($this.parent().siblings('.placeholder').text() != "Select City")
  //         find_colleges($this.data('value'));
  //     }
  //     if ($this.parents().children().hasClass('select_college')){
  //       if ($this.parent().siblings('.placeholder').text() != "Select College")
  //       find_department($this.data('value'));
  //     }
  //     if ($this.parents().children().hasClass('select_category'))
  //     {
  //       if ($this.parent().siblings('.placeholder').text() != "Event Category")
  //         find_subcategory($this.data('value'));
  //     }
  //     if ($this.parents().children().hasClass('select_state'))
  //     {
  //       if ($this.parent().siblings('.placeholder').text() != "State")
  //         find_city($this.data('value'));
  //     }
  //     if ($this.parents().children().hasClass('pageurl_required'))
  //     {
  //       if ($this.parent().siblings('.placeholder').text() != "Select Page URL")
  //         if ($this.data('value')=='/')
  //         {
  //           find_position('home');
  //         }
  //         else if($this.data('value')=='event/')
  //         {
  //           find_position('list');
  //         }
  //         else
  //         {
  //           find_position('details');
  //         }
  //     } 
  //     if ($this.parents().children().hasClass('position_required'))
  //     {
  //       if ($this.parent().siblings('.placeholder').text() != "Select Position")
  //         var page=$('#pageurl_required').val();
  //         if (page=='/')
  //         {
  //           var path='home';
  //         }
  //         else if(page=='event/')
  //         {
  //           var path='list';
  //         }
  //         else
  //         {
  //           var path='details';
  //         }
  //         find_price($this.data('value'),path);
  //     }  
  //     if ($this.parents().children().hasClass('festtype'))
  //       // alert($select.find('option[value="' + $this.data('value') + '"]'));
  //       $select.find('option[value="' + $this.data('value') + '"]').attr('selected', true);  

  //   });


  //   // Hide
  //   $container.on('clickoutside touchendoutside mouseoveroutside', function () {
  //     if (!dragging) {
  //       $container.removeClass('active');
  //       $list.slideUp(250);
  //     }
  //   });

  //   // Links
  //   if ($select.hasClass('links')) {
  //     $select.on('change', function () {
  //       window.location.href = select.val();
  //     });
  //   }

  //   $select.on('change', function () {
  //     console.log(changed);
  //     console.log($(this).val());
  //   });
  // };

  // $('select').each(function () {
  //   $(this).uouCustomSelect();
  // });

  

function find_position(path){
      $.get('/find_position/', { path: path }, function(data) {
      $('.position_required').html($('<option>').text("Select Position").attr('value', "position_required"));
      //$(".position_required").siblings('.select-clone').html($('<li>').text("Select Position").attr('data-value', "position_required"));
  
      $.each(data, function(key,value) {
        $('.position_required').append($('<option>').text(value.name).attr('value', value.name));
        $(".position_required").siblings('.select-clone').append($('<li>').text(value.name).attr('data-value', value.name));
      });
      });
    }
    function find_price(position,path){
      $.get('/find_price/', { position: position,path: path }, function(data) {
      //$(".price_required").siblings('.select-clone').html($('<li>').text("Select Position").attr('data-value', "price_required"));
      $.each(data, function(key,value) {
        //$('.price_required').append($('<option>').text(value.name).attr('value', value.name));
        //$(".price_required").siblings('.select-clone').append($('<li>').text(value.name).attr('data-value', value.id));
        $(".price_required").val(value.name);
        $('.banner_price_act').text('Amount: '+value.name)
      });
      });
    }

    function find_city(state){
      $.get('/find_city/', { state: state }, function(data) {
      $('.select_city').html($('<option>').text("Select City"));
      $(".select_city").siblings('.select-clone').html($('<li>').text("Select City").attr('data-value', "select_city"));
      $.each(data, function(key,value) {
        $('.select_city').append($('<option>').text(value.name).attr('value', value.id));
        $(".select_city").siblings('.select-clone').append($('<li>').text(value.name).attr('data-value', value.id));
      });
      });
    }


   function find_colleges(city_id){
      $.get('/find_colleges/', { city_id: city_id }, function(data) {
      $('.select_college').html($('<option>').text("Select College"));
      $(".select_college").siblings('.select-clone').html($('<li>').text("Select College").attr('data-value', "select_college"));
      $.each(data, function(key,value) {
        $('.select_college').append($('<option>').text(value.name).attr('value', value.id));
        $(".select_college").siblings('.select-clone').append($('<li>').text(value.name).attr('data-value', value.id));
      });
      });
    }


   function find_department(college_id){
      $.get('/find_department/', { college_id: college_id }, function(data) {
      $('.select_dept').html($('<option>').text("Select Department"));
      $(".select_dept").siblings('.select-clone').html($('<li>').text("Select Department").attr('data-value', "select_department"));
      $.each(data, function(key,value) {
        $('.select_dept').append($('<option>').text(value.name).attr('value', value.name));
        $(".select_dept").siblings('.select-clone').append($('<li>').text(value.name).attr('data-value', value.name));
      });
      });
    }

    function find_subcategory(category_id){
      $.get('/find_subcategory/', { category_id: category_id }, function(data) {
      $('.select_subcategory').html($('<option>').text("Event Subcategory").attr('value', "select_subcategory"));
      $(".select_subcategory").siblings('.select-clone').html($('<li>').text("Event Subcategory").attr('data-value', "select_subcategory"));
      $.each(data, function(key,value) {
        $('.select_subcategory').append($('<option>').text(value.name).attr('value', value.id));
        $(".select_subcategory").siblings('.select-clone').append($('<li>').text(value.name).attr('data-value', value.id));
      });
      });
    }

  // UOU Selects
  // ---------------------------------------------------------
  $.fn.uouCustomSelect = function () {

    var $select = $(this);

    $select.wrap('<div class="uou-custom-select"></div>');

    var $container = $select.parent('.uou-custom-select');

    $container.append('<ul class="select-clone"></ul>');

    var $list = $container.children('.select-clone'),
      placeholder = $select.data('placeholder') ? $select.data('placeholder') : $select.find('option:eq(0)').text();

    // $('<input class="value-holder" type="text" disabled="disabled" placeholder="' + placeholder + '"><i class="fa fa-chevron-down"></i>').insertBefore($list);
    $('<input class="value-holder" type="hidden" disabled="disabled" placeholder="' + placeholder + '"><span class="placeholder">' + placeholder + '</span><i class="fa fa-chevron-down"></i>').insertBefore($list);

    var $valueHolder = $container.children('.value-holder');
    var $valuePlaceholder = $container.children('.placeholder');

    // Create clone list
    $select.find('option').each(function () {
      var $this = $(this);

      $list.append('<li data-value="' + $this.val() + '">' + $this.text() + '</li>');
    });

    // Toggle list
    $container.on('click', function () {
      // console.log('click ' + $container);
      $container.toggleClass('active');
      $list.slideToggle(250);
    });

    // Option Select
   $list.delegate('li','click', function () {
      var $this = $(this);
      var id_value = $this.attr('data-value');     
      $valueHolder.val(id_value);
      $valuePlaceholder.html($this.text());
      // $(input.valueHolder).parent().next('input[type="hidden"]#subcategoryid').val(id_value);
      $select.find('option[value="' + $this.data('value') + '"]').prop('selected', true);
      // if ($this.parent('select-clone').siblings('select').hasClass('select_city'))
      if ($this.parents().children().hasClass('select_city'))
      { 
        
        if ($this.parent().siblings('.placeholder').text() != "Select City")
          find_colleges($this.data('value'));
      }
      if ($this.parents().children().hasClass('select_college')){
        if ($this.parent().siblings('.placeholder').text() != "Select College")
        find_department($this.data('value'));
      }
      if ($this.parents().children().hasClass('select_category'))
      {
        if ($this.parent().siblings('.placeholder').text() != "Event Category")
          find_subcategory($this.data('value'));
      }
      if ($this.parents().children().hasClass('select_state'))
      {
        if ($this.parent().siblings('.placeholder').text() != "State")
          find_city($this.data('value'));
      }
      if ($this.parents().children().hasClass('pageurl_required'))
      {
        if ($this.parent().siblings('.placeholder').text() != "Select Page URL")
          if ($this.data('value')=='/')
          {
            find_position('home');
          }
          else if($this.data('value')=='event/')
          {
            find_position('list');
          }
          else
          {
            find_position('details');
          }
      } 
      if ($this.parents().children().hasClass('position_required'))
      {
        if ($this.parent().siblings('.placeholder').text() != "Select Position")
          var page=$('#pageurl_required').val();
          if (page=='/')
          {
            var path='home';
          }
          else if(page=='event/')
          {
            var path='list';
          }
          else
          {
            var path='details';
          }
          find_price($this.data('value'),path);
      }  
      if ($this.parents().children().hasClass('festtype'))
        // alert($select.find('option[value="' + $this.data('value') + '"]'));
        $select.find('option[value="' + $this.data('value') + '"]').attr('selected', true);  

    });


    // Hide
    $container.on('clickoutside touchendoutside mouseoveroutside', function () {
      if (!dragging) {
        $container.removeClass('active');
        $list.slideUp(250);
      }
    });

    // Links
    if ($select.hasClass('links')) {
      $select.on('change', function () {
        window.location.href = select.val();
      });
    }

    $select.on('change', function () {
      console.log(changed);
      console.log($(this).val());
    });
  };

  $('select').each(function () {
    $(this).uouCustomSelect();
  });



  // map initialization
  //-----------------------------------

  // home-map customization

  // $("#map_canvas").goMap({

  //   maptype: 'ROADMAP',
  //   scrollwheel: false,
  //   zoom: 6,
  //   markers: [{
  //       latitude: 46.454889270677576,
  //       longitude: 7.45697021484375,
  //       icon: 'img/content/map-marker.png',
  //       html: 'Globo'
  //     },{
  //       latitude: 49.31079887964633,
  //       longitude: 4.361572265625,
  //       icon: 'img/content/map-derection-100.png',
  //       html: 'Globo'
  //     },{
  //       latitude: 44.96479793033104,
  //       longitude: 4.691162109375,
  //       icon: 'img/content/map-direction-1000.png',
  //       html: 'Globo'
  //     },{
  //       latitude: 45.39844997630408,
  //       longitude: 11.019287109375,
  //       icon: 'img/content/map-direction-20.png',
  //       html: 'Globo'

  //     },{
  //       latitude: 45.69083283645816,
  //       longitude: 16.336669921875,
  //       icon: 'img/content/map-direction-8.png',
  //       html: 'Globo'
  //     },{
  //       latitude: 47.56170075451973,
  //       longitude: 14.315185546875,
  //       icon: 'img/content/map-direction-50.png',
  //       html: 'Globo'
  //   }]
  // });


  // company map initialization
  
  // $("#company_map_canvas").goMap(
    
  
  // {
  //   maptype: 'ROADMAP',
  //   zoom: 15,
  //   scrollwheel: false,
  //   address: address1,
  //   markers: [{
  //       latitude:latitude1,
  //       longitude:longitude1,
  //       icon: '{{ STATIC_URL|escapejs}}/img/map-marker-company.png',
  //       html: 'Globo'
  //     }]
  // });

  // company-map-street






  // contact map

  // $("#contact_map_canvas").goMap({
  //   maptype: 'ROADMAP',
  //   zoom: 13,
  //   scrollwheel: false,

  //   markers: [{
  //     latitude: 37.793100669930396,
  //     longitude: -122.41769313812256,
  //     icon: 'img/content/map-marker-company.png',
  //     html: 'Globo'
  //   }]
  // });



  // company-contact map




  // $('a[data-toggle="tab"]').on('shown.bs.tab', function (event) {
  //   if(event.target.outerText == 'CONTACT'){
  //     $("#contact_map_canvas_one").goMap({
  //       maptype: 'ROADMAP',
  //       zoom: 13,
  //       scrollwheel: false,

  //       markers: [{
  //         latitude: 37.792218928191865,
  //         longitude: -122.43700504302979,
  //         icon: 'img/content/map-marker-company.png'
  //       }]
  //     });


  //     $("#contact_map_canvas_two").goMap({

  //       maptype: 'ROADMAP',
  //       zoom: 13,
  //       scrollwheel: false,

  //       markers: [{
  //         latitude: 37.77125750792944,
  //         longitude: -122.4085521697998,
  //         icon: 'img/content/map-marker-company.png'
  //       }]
  //     });
  //   }
  // });
  







  // distance slider initialize

  // distance slider

  $( "#slider-range-min" ).slider({
    range: "min",
    value: 42,
    min: 1,
    max: 100,
    slide: function( event, ui ) {
      $( "#amount" ).val( ui.value +   "km" );
    }
  });
  $( "#amount" ).val( $( "#slider-range-min" ).slider( "value" ) +   "km");


  $( "#slider-range-search" ).slider({
    range: "min",
    value: 42,
    min: 1,
    max: 100,
    slide: function( event, ui ) {
      $( "#amount-search" ).val( ui.value +   "km" );
    }
  });
  $( "#amount-search" ).val( $( "#slider-range-search" ).slider( "value" ) +   "km");




  $( "#slider-range-search-day" ).slider({
    range: "min",
    value: 20,
    min: 1,
    max: 300,
    slide: function( event, ui ) {
      $( "#amount-search-day" ).val(  "<"  + ui.value );
    }
  });
  $( "#amount-search-day" ).val( "<" +  $( "#slider-range-search-day" ).slider( "value" ) );





  // Accordion
  // ---------------------------------------------------------
  $('.accordion').each(function () {

    $(this).find('ul > li > a').on('click', function (event) {
      event.preventDefault();

      var $this = $(this),
        $li = $this.parent('li'),
        $div = $this.siblings('div'),
        $siblings = $li.siblings('li').children('div');

      if (!$li.hasClass('active')) {
        $siblings.slideUp(250, function () {
          $(this).parent('li').removeClass('active');
        });

        $div.slideDown(250, function () {
          $li.addClass('active');
        });
      } else {
        $div.slideUp(250, function () {
          $li.removeClass('active');
        });
      }
    });

  });



  // header login register scripts
  //-------------------------------------------

  var $headerLoginRegister = $('#header .header-login, #header .header-register');

  $headerLoginRegister.each(function () {
    var $this = $(this);

    $this.children('a').on('click', function (event) {
      event.preventDefault();
      $this.toggleClass('active');
      $this.siblings().removeClass('active');
      $('#header .header-language').removeClass('active');
      $('#header .header-social').removeClass('active');
    });

    $this.on('clickoutside touchendoutside', function () {
      if ($this.hasClass('active')) { $this.removeClass('active'); }
    });
  });



  var $headerNavbar = $('#header .header-nav-bar .primary-nav > li');

  $headerNavbar.each(function () {
    var $this = $(this);

    $this.children('a').on('click', function (event) {
      $this.toggleClass('active');
    });

    $this.on('clickoutside touchendoutside', function () {
      if ($this.hasClass('active')) { $this.removeClass('active'); }
    });
  });




  // Header Language Toggle
  var $headerLanguageToggle = $('#header .header-language');

  $headerLanguageToggle.children('a').on('click', function (event) {
    event.preventDefault();
    $(this).parent('.header-language').toggleClass('active');
    $('#header .header-login').removeClass('active');
    $('#header .header-register').removeClass('active');
    $('#header .header-social').removeClass('active');

  });

  $headerLanguageToggle.on('clickoutside touchendoutside', function () {
    if ($headerLanguageToggle.hasClass('active')) { $headerLanguageToggle.removeClass('active'); }
  });

  // Header Social Toggle
  
  var $headerSocialToggle = $('#header .header-social');
 
  $headerSocialToggle.children('a').on('click', function (event) {
    event.preventDefault();
    $(this).parent('.header-social').toggleClass('active');
    $('#header .header-login').removeClass('active');
    $('#header .header-register').removeClass('active');
    $('#header .header-language').removeClass('active');
  });

  $headerSocialToggle.on('clickoutside touchendoutside', function () {
    if ($headerSocialToggle.hasClass('active')) { $headerSocialToggle.removeClass('active'); }
  });



  // sub-categories remove and active class
  //-----------------------------------------------------
  var $CategoryLink = $('#categories .accordion ul li div a');

  $CategoryLink.on('click', function(){
    $(this)
      .addClass('active')
      .siblings().removeClass('active')
      .parent().parent().siblings('li').children('div a').click(function(){
        $CategoryLink.removeClass('active');
      });
  });



  // style switcr for list-grid view
  //--------------------------------------------------
  $('.change-view button').on('click',function(e) {

    if ($(this).hasClass('grid-view')) {
      $(this).addClass('active');
      $('.list-view').removeClass('active');
      $('.page-content .view-switch').removeClass('product-details-list').addClass('product-details');

    } else if($(this).hasClass('list-view')) {
      $(this).addClass('active');
      $('.grid-view').removeClass('active');
      $('.page-content .view-switch').removeClass('product-details').addClass('product-details-list');
      }
  });




  // company-heading slider content
  //--------------------------------------------------------
  $('.button-content button').on('click',function(e) {
    console.log('clickes');

    if ($(this).hasClass('general-view-btn')) {
      $(this).addClass('active')
      .siblings().removeClass('active')
      .parent().parent().next().css("left","0%");


    } else if($(this).hasClass('map-view-btn')) {
      $(this).addClass('active')
      .siblings().removeClass('active')
      .parent().parent().next().css("left","-100%");

    } else if($(this).hasClass('male-view-btn')) {
      $(this).addClass('active')
     .siblings().removeClass('active')
     .parent().parent().next().css("left","-200%");
    }

  });


  $("a").click(function(e){
    if($(this).attr("href") === '#'){
      e.preventDefault();
    }
  });



  $('input, textarea').placeholder();


}(jQuery));



$("document").ready(function($){
  var nav = $('.header-search-bar');




  $(window).scroll(function () {
    if ($(this).scrollTop() > 60) {
        nav.addClass("sticky");

    } else {
        nav.removeClass("sticky");
    }

  });

  
});


  jQuery.fn.center = function () {
    this.css("top", ( jQuery(window).height() - this.height() ) / 2+jQuery(window).scrollTop()+100 + "px");
    return this;
  }
  
  $(window).scroll(function (){
    $(".popup_pos").center();
        
  });

$(document).mousemove(function(e){
    if(e.pageY>75 && e.pageY< 275){
      $('.header-search-bar').slideDown();
    }
    else{
      $('.header-search-bar').hide();
    }
  });

$("document").ready(function($){
  //alert($(window).height());
  $('.header-search-bar').show();

  
  $('.slider-content #home-slider .item > img').css('height',$(window).height()-75);
  $('.slider-content').css('height',$(window).height()-75);
  if ($.cookie('eventdescription')){
      $('.eventdescription').val($.cookie('eventdescription'));
  }

  var body_win_height = parseInt(document.body.clientHeight) ;
  var win_height = parseInt(document.documentElement.clientHeight) ;
  
  if( body_win_height > win_height) {
      $('.popup_fade').height(body_win_height);
  } else {
      $('.popup_fade').height(win_height);
  }
  
  $(".popup_pos").center();

  $('.popup_cancel_btn').on('click',function() {
    $('.pop_up').hide();
    $('.popup_fade').hide();
  });

  $('.cancel_btn, .close_btn').on('click', function (){
    $.removeCookie('plan',{ path: '/' });
    $('.deposit_popup, .popup_fade, .forgotpassword_popup, .terms_services_popup, #signin_popup, #joinus_popup_content, #signin_popup1, #email_activate, #login_window, #login_window1, .lead_details_popup, #directbuy_signin_popup, #auction_popup, #ask_question_popup, #thank_you_popup').hide();
    $('#plan_change').show();
    $('input[name="plan"]').val() == '';
  });

  $('.login_act').on('click', function (){
        $('.popup_fade:first').show();
        $('#signin_popup').show();
        
  });


  // $('.addpost_tipsy').tipsy({gravity: 'e'});
  // $('.addbanner_tipsy').tipsy({gravity: 'e'});

  // home slider section
  //-------------------------------------------
  var homeSlide = $("#home-slider");

  homeSlide.owlCarousel({
    
    items : 1,
    loop:true,
    autoPlay: true,
    navigation : false, // Show next and prev buttons
    slideSpeed : 600,
    paginationSpeed : 600,
    singleItem:true


  });


  // Custom Navigation Events
    $(".next").click(function(){
      homeSlide.trigger('owl.next');
    });
    $(".prev").click(function(){
      homeSlide.trigger('owl.prev');
    });



  $(function() {    
    $("#fitltercitytxt" ).autocomplete({
    open: function(){
        setTimeout(function () {
            $('.ui-autocomplete').css('z-index', 9999);
        }, 0);
    },

    source: function (request, response) {

        $.getJSON("/getcity_base?term=" + request.term, function (data) {             
            response($.map(data, function (value, key) {                            
                return {
                    label: value.label,
                    value: value.value,
                    extra: value.cityid
                };
            }));
        });
    },
    select : function(event, ui) {
            $('#fitltercity').val(ui.item.extra);                
    },
    minLength: 2,
    delay: 100
    });
  });

  $(function() {    
    $("#state" ).autocomplete({
    open: function(){
        setTimeout(function () {
            $('.ui-autocomplete').css('z-index', 9999);
        }, 0);
    },

    source: function (request, response) {
        $.getJSON("/getstate?term=" + request.term, function (data) {             
            response($.map(data, function (value, key) {                            
                return {
                    label: value.label,
                    value: value.value,
                    extra: value.cityid
                };
            }));
        });
    },
    select : function(event, ui) {
            $('#statetxt').val(ui.item.value);                
    },
    minLength: 2,
    delay: 100
    });
  });
  $(function() {    
    $("#city" ).autocomplete({
    open: function(){
        setTimeout(function () {
            $('.ui-autocomplete').css('z-index', 9999);
        }, 0);
    },

    source: function (request, response) {
         var state=$('#statetxt').val();
        $.getJSON("/getcity?term=" + request.term+"&state="+state, function (data) {             
            response($.map(data, function (value, key) {                            
                return {
                    label: value.label,
                    value: value.value,
                    extra: value.cityid
                };
            }));
        });
    },
    select : function(event, ui) {
            $('#citytxt').val(ui.item.extra);                
    },
    minLength: 2,
    delay: 100
    });
  });

  $(function() {    
    $("#college" ).autocomplete({
    open: function(){
        setTimeout(function () {
            $('.ui-autocomplete').css('z-index', 9999);
        }, 0);
    },

    source: function (request, response) {
        var city=$('#citytxt').val();
        $.getJSON("/getcollege?term=" + request.term+"&city="+city, function (data) {             
            response($.map(data, function (value, key) {                            
                return {
                    label: value.label,
                    value: value.value,
                    extra: value.collegeid
                };
            }));
        });
    },
    select : function(event, ui) {
            $('#collegetxt').val(ui.item.extra);                
    },
    minLength: 2,
    delay: 100
    });
  });

  $(function() {    
    $("#dept" ).autocomplete({
    open: function(){
        setTimeout(function () {
            $('.ui-autocomplete').css('z-index', 9999);
        }, 0);
    },

    source: function (request, response) {
        var college=$('#collegetxt').val();
        $.getJSON("/getdept?term=" + request.term+"&college="+college, function (data) {             
            response($.map(data, function (value, key) {                            
                return {
                    label: value.label,
                    value: value.value,
                    extra: value.cityid
                };
            }));
        });
    },
    select : function(event, ui) {
            $('#depttxt').val(ui.item.value);                
    },
    minLength: 2,
    delay: 100
    });
  });


  $('.select-location,.category-search').click(function(){
    //$('.base_search').focus();
  });


  $("a.bookmark").click(function(e){

     // this will prevent the anchor tag from going the user off to the link
    var bookmarkUrl = this.href;
    var bookmarkTitle = this.title;
    if (window.sidebar) { // For Mozilla Firefox Bookmark
      e.preventDefault();
      window.sidebar.addPanel(bookmarkTitle, bookmarkUrl,"");
    } else if( window.external || document.all) { // For IE Favorite
        e.preventDefault();
        window.external.AddFavorite( bookmarkUrl, bookmarkTitle);
    } else if(window.opera) { // For Opera Browsers
        e.preventDefault();
        $("a.bookmark").attr("href",bookmarkUrl);
        $("a.bookmark").attr("title",bookmarkTitle);
        $("a.bookmark").attr("rel","sidebar");
    } else { // for other browsers which does not support
        alert('Your browser does not support this bookmark action');
      return false;
  }
  });

$('.eventdetail_fields').hide();
$('.user_fields').hide();

$('.events').click(function(){
  $('.events_fields').toggle();
});

// $('.events_details').click(function(){
//   $('.eventdetail_fields').toggle();
//   $('.events_fields').hide();
// });

// $('.user_details').click(function(){
//   $('.user_fields').toggle();
//   $('.eventdetail_fields').hide();
//   $('.events_fields').hide();
// });


    // $( "#datepicker" ).datepicker({
    //   changeMonth: false,
           
    // });
    //  $( "#datepicker1" ).datepicker({
    //   changeMonth: false,
      
      
    // });
    //  $( "#datepicker_deadline" ).datepicker({
    //   changeMonth: false,
      
     
    // });


  $('.bxslider').bxSlider({
  auto: true,
  autoControls: true
});          
 // validation by pradeepa//

  
  //login form validation

  var sign_in_required =["emailid_signup", "password_signup"];

  jQuery('#signin').click(function(){     
      for (i=0;i<sign_in_required.length;i++) {
      var input = jQuery('#'+sign_in_required[i]);
      if (input.val() == "")  {   
        input.addClass("error_input_field");
        input.css({"width":"50%"});
        input.next('.labelError').show();         
      } else {    
        input.removeClass("error_input_field");
        input.css({"width":"104%"});
        input.next('.labelError').hide();        
      }
    }
    

    if ($(":input").hasClass("error_input_field")){
    return false;
    }
    else{
      $('form[name="sign_in"]').submit();      
      return true;
    }
    });

  //Registration form validation

  var sign_up_required =["emailid_signin", "username_signin", "lastname_signin", "mobile_signin" ];

  jQuery('#create_user').click(function(){    
      for (i=0;i<sign_up_required.length;i++) {
      var input = jQuery('#'+sign_up_required[i]);
      if (input.val() == "")  {   
        input.addClass("error_input_field");
        input.css({"width":"50%"});
        input.next('.signup_labelError').css({"color":"red"}).show();         
      } else {    
        input.removeClass("error_input_field");
        input.css({"width":"104%"});
        input.next('.signup_labelError').hide();        
      }
    }

    //password

    if($('#password_signin').val() == ''){   
        $('#password_signin').addClass("error_input_field");
        $('#password_signin').css({"width":"50%"});
        $('#password_signin').next().next('.signup_labelError').css({"color":"red"}).show();         
      } else {    
        $('#password_signin').removeClass("error_input_field");
        $('#password_signin').css({"width":"104%"});
        $('#password_signin').next().next('.signup_labelError').hide();       
      }


    //Validate the e-mail

    if($('#emailid_signin').val() != ''){
    if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($('#emailid_signin').val())) {
      $('#emailid_signin').addClass("error_input_field");
      $('#emailid_signin').css({"width":"50%"});
      $('#emailid_signin').next().next('.error_message').css({"color":"red"}).show();
      // $('.error_message').show();
    }
    else
    {
      $('#emailid_signin').removeClass("error_input_field");
      $('#emailid_signin').css({"width":"104%"});
      $('#emailid_signin').next().next('.error_message').hide();
    }
    }

    $('#user_form .select-clone').each(function(){
      if( $(this).siblings('.placeholder').text() == 'Select City' || $(this).siblings('.placeholder').text() == 'Select College' || $(this).siblings('.placeholder').text() == 'Select Department'){
        $(this).addClass('error_input_field');
        $(this).parent().next('.signup_labelError').css("cssText", "display: block; position:absolute;top:4px;left:210px;color:red").show();
        $(this).parent().css("cssText", "width: 196px !important;");
      } 
      else{
        $(this).removeClass('error_input_field');
        $(this).parent().next('.signup_labelError').hide();
        $(this).parent().css("cssText", "width: 411px !important;");
      }
      
    });

    if ($(":input").hasClass("error_input_field") || $('#user_form .select-clone').hasClass('error_input_field')){
    return false;
    }
    else{
      $('form[name="sign_up"]').submit();      
      return true;
    }
    });     
  //end validation//

  //postevent form validation

  //events
    // var events_required =["festname_required", "festcaption_val"];
  $('.free').click(function(){
    $('input[name="plan"]').val($('input[name="free"]').val());
    $('.plan_table_act').hide();
    $('.eventdetail_fields').show();
    
  });
  $('.paid').click(function(){
    $('input[name="plan"]').val($('input[name="paid"]').val());
    $('.plan_table_act').hide();
    $('.eventdetail_fields').show();
  });
  $('.login_act').click(function(){
    $('input[name="plan"]').val($('input[name="paid"]').val());
  });
  if($.cookie('plan')){
    $('.plan_table_act').hide();
  }
  else{
   $('.plan_table_act').show(); 
  }
  $('.plan_change').click(function(){
    $('.plan_table_act').show();
  });

  jQuery('.free,.events_details,.login_act,.paid').click(function(){     

    if($('.eventtitle').val() == ''){
      $('.eventtitle_error').show();
      return false;
    }
    else{
      $('.eventtitle_error').hide();
    }

    if($('.startdate').val() == ''){
      $('.date1_error').show();
      return false;
    }
    else{
      $('.date1_error').hide();
    }  

    if($('.enddate').val() == ''){
      $('.date2_error').show();
      return false;
    }
    else{
      $('.date2_error').hide();
    }

    if($('.category').val() == ''){
      $('.category_error').show();
      return false;
    }
    else{
      $('.category_error').hide();
    }
    if($('.eventtype').val() == 'select_subcategory'){
      $('.subcategory_error').show();
      return false;
    }
    else{
      $('.subcategory_error').hide();
    }
    if($('.eventdescription').val() == ''){
      $('.eventdescription_error').show();
      return false;
    }
    else{
      $('.eventdescription_error').hide();
      var date = new Date();
      date.setTime(date.getTime() + (120 * 1000));
      $.cookie('eventtitle',$('.eventtitle').val(),{path: '/',raw: true, expires: date});
      $.cookie('startdate',$('.startdate').val(),{path: '/',raw: true,expires: date });
      $.cookie('enddate',$('.enddate').val(),{path: '/',raw: true,expires: date});
      if ($.cookie('category')){
        $.cookie('category',$('.category_id').val(),{path: '/',raw: true,expires: date});
        $.cookie('category_name',$('.category_name').val(),{path: '/',raw: true,expires: date});
        
      }
      else{
        $.cookie('category',$('.category option:selected').val(),{path: '/',raw: true,expires: date});
        $.cookie('category_name',$('.category option:selected').text(),{path: '/',raw: true,expires: date});
        
      }
      if ($.cookie('eventtype')){
        $.cookie('eventtype',$('.eventtype_id').val(),{path: '/',raw: true,expires: date});
        $.cookie('eventtype_name',$('.eventtype_name').val(),{path: '/',raw: true,expires: date});
      }
      else{
        $.cookie('eventtype',$('.eventtype option:selected').val(),{path: '/',raw: true,expires: date});
        $.cookie('eventtype_name',$('.eventtype option:selected').text(),{path: '/',raw: true,expires: date});
      }
      $.cookie('eventdescription',$('.eventdescription').val(),{path: '/',raw: true,expires: date});
      $.cookie('plan',$('input[name="plan"]').val(),{path: '/',raw: true,expires: date});

    }
    if($('input[name="plan"]').val() == ''){
      $('.plan_error').show();
      return false;
    }
    else{
      $('.plan_error').hide();
      $('.eventdetail_fields').show();
    }

  });

  //Event details

jQuery('.user_details').click(function(){     

    if($('.address').val() == ''){
      $('.address_error').show();
      return false;
    }
    else{
      $('.address_error').hide();
    }

    if($('.organizer').val() == ''){
      $('.organizer_error').show();
      return false;
    }
    else{
      $('.organizer_error').hide();
    }  

    if($('.state').val() == ''){
      $('.state_error').show();
      return false;
    }
    else{
      $('.state_error').hide();
    }

    if($('.select_city').val() == ''){
      $('.city_error').show();
      return false;
    }
    else{
      $('.city_error').hide();
    }
    if($('.college').val() == ''){
      $('.college_error').show();
      return false;
    }
    else{
      $('.college_error').hide();
    }
    if($('.dept').val() == ''){
      $('.dept_error').show();
      return false;
    }
    else{
      $('.dept_error').hide();
      $('.user_fields').show();
    }


  });
// Image upload
    $(document).on('change','.poster',function(){
      files = this.files;
      size = files[0].size;
      var oFReader = new FileReader();
      oFReader.readAsDataURL(this.files[0]);
      oFReader.onload = function (oFREvent) {
        var image = new Image();
        image.src = oFREvent.target.result;
        image.onload = function () {
          if ((this.width > 1200) && (this.height>700)&& (this.width<650)&& (this.height<1100)&& (this.size > 1024*2000)) {
            alert("choose another file");
          }
         // access image size here & do further implementation
        };
      };
      //max size 50kb => 50*1000
      if( size > 1024*2000){
       alert('Please upload less than 2mb file');
       return false;
      }
      else{
        $('.user_fields').show();
        // $.cookie('address',$('.address').val());
        // $.cookie('organizer',$('.organizer').val());
        // $.cookie('state',$('.state').val());
        // $.cookie('city_post',$('.city' ).val());
        // $.cookie('college',$('.college').val());
        // $.cookie('dept',$('.dept').val());
        
        // var imgData = getBase64Image(bannerImage);
        // var localStorage.setItem("imgData", imgData);
        return true;
      }
      
    });
  // user validation
$('.post_event,#paid').click(function(){
  
  if($('.name').val() == ''){
      $('.name_error').show();
      return false;
    }
    else{
      $('.name_error').hide();
    }
    if($('.email').val() == ''){
      $('.email_error').show();
      return false;
    }
    else{
      $('.email_error').hide();
    }
    if($('.mobile').val() == '' ){
      // alert($('.mobile').val());
      $('.mobile_error').show();
      return false;
    }
    else{
      $('.mobile_error').hide();
    }
  $.cookie('name',$('.name').val(),{path: '/',raw: true});
  $.cookie('email',$('.email').val(),{path: '/',raw: true});
  $.cookie('mobile',$('.mobile').val(),{path: '/',raw: true});
});


  //upload banner validation

  jQuery('#banner_upload').click(function(){

    if($('.position_required').val() == 'Select Position'){
            $(this).addClass("error_input_field");
            $('.position_labelError').show();
        }
        else{
          $(this).removeClass("error_input_field");
          $('.position_labelError').hide(); 
        }

    if($('.pageurl_required').val() == 'Select Page URL'){
            $(this).addClass("error_input_field");
            $('.pageurl_labelError').show();
        }
        else{
          $(this).removeClass("error_input_field");
          $('.pageurl_labelError').hide(); 
        }

    if($('.price_required').val() == 'Select Price'){
            $(this).addClass("error_input_field");
            $('.price_labelError').show();
        }
        else{
          $(this).removeClass("error_input_field");
          $('.price_labelError').hide(); 
        }

      if($('.link_required').val() == ''){   
        $('.link_required').addClass("error_input_field");
        $('.link_required').next('.link_labelError').show();         
      } else {    
        $('.link_required').removeClass("error_input_field");
        $('.link_required').next('.link_labelError').hide();       
      }

    if ($(".position_required, .pageurl_required, .price_required, .link_required").hasClass("error_input_field")){
    return false;
    } else {
      $('form[name="upload_banner"]').submit();
      $('.payment') 
      $('.banner_price').text($('#price_required').val());     
      return true;
    }

});

  // //Payment

  // var payment_details =["fname_required", "lname_required", "mobileno_val", "email_blank"];

  // jQuery('#paynow').click(function(){     
  //     for (i=0;i<payment_details.length;i++) {
  //     var input = jQuery('#'+payment_details[i]);
  //     if (input.val() == "")  {   
  //       input.addClass("error_input_field");
  //       input.next('.pay_labelError').show();         
  //     } else {    
  //       input.removeClass("error_input_field");
  //       input.next('.pay_labelError').hide();        
  //     }
  //   }

  // if($('.prefix_required').val() == 'Select'){
  //           $(this).addClass("error_input_field");
  //           $('.prefix_labelError').show();
  //       }
  //       else{
  //         $(this).removeClass("error_input_field");
  //         $('.prefix_labelError').hide(); 
  //       }

  // if ($(":input").hasClass("error_input_field")){
  //     return false;
  //     }
  //     else{
  //       $('form[name="payment_form"]').submit();      
  //       return true;
  //    }
     
  //   });

  //password strength

  // $('#password_signin').keyup(function(){
  //    strength_status = checkStrength($('#password_signin').val());
  //    $('#password_signin').css({"width":"50%"});
  //    if ($(this).next().next('.signup_labelError').text() == "Too short" || $(this).next().next('.signup_labelError').text() == "Weak" )
  //     $(this).next().next('.signup_labelError').css({"color":"red"});
  //    else if ($(this).next().next('.signup_labelError').text() == "Fair")
  //     $(this).next().next('.signup_labelError').css({"color":"yellow"});
  //    else if ($(this).next().next('.signup_labelError').text() == "Good")
  //     $(this).next().next('.signup_labelError').css({"color":"lightblue"});
  //    else
  //     $(this).next().next('.signup_labelError').css({"color":"green"});
  //   $(this).next().next('.signup_labelError').text(strength_status).show();
  //   });

  $('#password_signin').keyup(function(){
     strength_status = checkStrength($('#password_signin').val());
     // alert(strength_status);
     $('#password_signin').css({"width":"50%"});    
     if ($(this).next().next('.signup_labelError').text() == "Too short" || $(this).next().next('.signup_labelError').text() == "Weak")
      $(this).next().next('.signup_labelError').css({"color":"red"});
     else if ($(this).next().next('.signup_labelError').text() == "Fair")
      $(this).next().next('.signup_labelError').css({"color":"yellow"});
     else if ($(this).next().next('.signup_labelError').text() == "Good")
      $(this).next().next('.signup_labelError').css({"color":"lightblue"});
     else if ($(this).next().next('.signup_labelError').text() == "Strong" )
      $(this).next().next('.signup_labelError').css({"color":"green"});
    $(this).next().next('.signup_labelError').text(strength_status).show();
  });

});

    function checkStrength(password){
    //initial strength
    var strength = 0
 
    //if the password length is less than 6, return message.
    if (password.length < 6) {
        $('#result').removeClass()
        $('#result').addClass('short')
        return 'Too short'
    }
 
    //length is ok, lets continue.
 
    //if length is 8 characters or more, increase strength value
    if (password.length > 7) strength += 1
 
    //if password contains both lower and uppercase characters, increase strength value
    if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/))  strength += 1
 
    //if it has numbers and characters, increase strength value
    if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/))  strength += 1 
 
    //if it has one special character, increase strength value
    if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/))  strength += 1
 
    //if it has two special characters, increase strength value
    if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,",%,&,@,#,$,^,*,?,_,~])/)) strength += 1
 
    //now we have calculated strength value, we can return messages
 
    //if value is less than 2
    if (strength < 2 ) {
        $('#result').removeClass()
        $('#result').addClass('weak')
        return 'Weak'
    } else if (strength == 2 ) {
        $('#result').removeClass()
        $('#result').addClass('fair')
        return 'Fair'
    } 
    else if (strength == 3 ) {
        $('#result').removeClass()
        $('#result').addClass('good')
        return 'Good'
    } else {
        $('#result').removeClass()
        $('#result').addClass('strong')
        return 'Strong'
    }
}  
$('.payment').hide();
$('#paid').click(function(){
  $('.payment').toggle();
});

// $('#create_user').click(function(){
  // $('.popup').show();
// });

var thewidth=$('.advertisement img').width();
var theheight=$('.advertisement img').height();
//$('.advertisement img').css({'margin-left':-thewidth/2+'px','margin-top':-theheight/2+'px'});



$(function() {

  var alocate = $('#lady').offset().top;

  $('#lady_btn').click(function(){
    $(`html,body`).scrollTop(alocate);
  });


  var alocate = $('#men').offset().top;

  $('#men_btn').click(function(){
    $(`html,body`).scrollTop(alocate);
  });



  var alocate = $('#appliance').offset().top;

  $('#appliance_btn').click(function(){
    $(`html,body`).scrollTop(alocate);
  });


  var alocate = $('#toy').offset().top;

  $('#toy_btn').click(function(){
    $(`html,body`).scrollTop(alocate);
  });



  var alocate = $('#CHANEL').offset().top;

  $('#CHANEL_btn').click(function(){
    $(`html,body`).scrollTop(alocate);
  });


  var alocate = $('#COACH').offset().top;

  $('#COACH_btn').click(function(){
    $(`html,body`).scrollTop(alocate);
  });


  var alocate = $('#LOUISVUITTON').offset().top;

  $('#LOUISVUITTON_btn').click(function(){
    $(`html,body`).scrollTop(alocate);
  });


  var alocate = $('#GUCCI').offset().top;

  $('#GUCCI_btn').click(function(){
    $(`html,body`).scrollTop(alocate);
  });



    $(document).ready(function(){
        $('.mein_pic').bxSlider({
            auto: true,
            pause: 5000,
        });
    });

});
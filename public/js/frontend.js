$(document).ready(function(){
  initCarousel();
  $(window).scroll(function(){
    if($(window).scrollTop() > 1000)
      $("#back-to-top").fadeIn('fast');
    else
      $("#back-to-top").fadeOut('2000');
  });
  $("#back-to-top").click(function(){
    $('body').animate({
      scrollTop: 0
    }, 'fast');
    return false;
  });
});

function initCarousel() {
  var visible;
  if($(window).width() > 979) {
    visible = 3;
  } else if($(window).width() < 979 && $(window).width() > 767) {
    visible = 2;
  } else if ($(window).width() < 767 && $(window).width() > 480){
    visible = 3;
  } else if($(window).width() < 480) {
    visible = 1;
  }
        
  $('.jcarousel').jcarousel({
    scroll: 1,
    visible: visible,
    initCallback: function(carousel) {
      $("#control-right").bind('click', function(){
        carousel.next();
        return false;
      })
      $("#control-left").bind('click', function(){
        carousel.prev();
        return false;
      })
    },
    itemFallbackDimension: 120
  });
}
      
$(window).resize(function(){
  initCarousel();
});



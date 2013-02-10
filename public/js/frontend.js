jQuery(document).ready(function(){
  initCarousel();
  jQuery(window).scroll(function(){
 
    // if you want to measure 1000px from the top, use --&gt; if(jQuery(window).scrollTop() &gt; 1000)
    // if you want to measure 1000px from the bottom, use  --&gt; if(jQuery(document).height() - jQuery(window).height() - jQuery(window).scrollTop() &lt; 1000)           
    // check whether the scroll has reached 1000px from the top     
    if(jQuery(window).scrollTop() > 1000){
      // show back to top
      jQuery('#back-to-top').stop().animate({
        opacity: 1
      });
      
    }
    else{
      // hide back to top
      jQuery('#back-to-top').stop().animate({
        opacity: 0
      });
    }
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


var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-38322604-1']);
_gaq.push(['_trackPageview']);
_gaq.push(['_setDomainName', 'none']);

//(function() {
//  var ga = document.createElement('script');
//  ga.type = 'text/javascript';
//  ga.async = true;
//  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
//  var s = document.getElementsByTagName('script')[0];
//  s.parentNode.insertBefore(ga, s);
//})();
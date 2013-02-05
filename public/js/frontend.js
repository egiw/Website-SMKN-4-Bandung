jQuery(document).ready(function(){
 
  jQuery(window).scroll(function(){
 
    // if you want to measure 1000px from the top, use --&gt; if(jQuery(window).scrollTop() &gt; 1000)
    // if you want to measure 1000px from the bottom, use  --&gt; if(jQuery(document).height() - jQuery(window).height() - jQuery(window).scrollTop() &lt; 1000)           
    // check whether the scroll has reached 1000px from the top     
    if(jQuery(window).scrollTop() > 1000){
      // show back to top
      jQuery('#back-to-top').stop().animate({opacity: 1});
      
    }
    else{
      // hide back to top
      jQuery('#back-to-top').stop().animate({opacity: 0});
    }
  });
 
});
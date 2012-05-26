// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .

   $(function(){
       $('.toggleLink').click(function(){
           $('#toggle_div').toggle();
       });
   });

   // notice the hash(#) and dot(.) before the elements? A hash represents an HTML ID and a 
   // dot represents an HTML class. I made the link have a class, and the toggle_div an ID 
   // but you may use whatever you'd like, just make sure if you're referencing an ID that you put
   // a hash(#) before it and if you're referencing a class, make sure you put a dot(.) before it.


   // this javascript should also be in your application.js, or some other JS file. The whole reason link_to_remote and 
   // those other "remote" tags were deprecated is to maintain unobtrusive javascript (take the JS out of the views).
   // this makes for cleaner, separated, more modular code.

$(function () {  
  $('#sinhviens .pagination a').live('click', 
    function () {  
      $.getScript(this.href);  
      return false;  
    }  
  );  
}); 

$('input.filldrl').on('keyup',function(e) {
        
        var $this = $(this);
        value = $this.val();
        alert(value);
        name = $this.attr("name");
         id = $this.attr("id");
        var $same = $(":input[name='" + name + "']");
         $same.val(value);
 
});

$(function() {
  $('#sinhviens th a').live('click', function () {  
    $.getScript(this.href);  
    return false;  
  });  
  $('#sinhviens_search input').keyup(function () {  
  $.get($('#sinhviens_search').attr('action'), 
    $('#sinhviens_search').serialize(), null, 'script');  
  return false;  
    });  
});

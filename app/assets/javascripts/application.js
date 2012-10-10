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
//= require_tree .

$(function(){
  $('#add_but').click(function(){
    $('#form_tr').css('display','');
    $('#add_tr').css('display','none');
  });

  $(document).on("click", "div.message", function(event){
    var e=this; 
    if(window.getSelection){ 
    var s=window.getSelection(); 
    if(s.setBaseAndExtent){ 
    s.setBaseAndExtent(e,0,e,e.innerText.length-1); 
    }else{ 
    var r=document.createRange(); 
    r.selectNodeContents(e); 
    s.removeAllRanges(); 
    s.addRange(r);} 
    }else if(document.getSelection){ 
    var s=document.getSelection(); 
    var r=document.createRange(); 
    r.selectNodeContents(e); 
    s.removeAllRanges(); 
    s.addRange(r); 
    }else if(document.selection){ 
    var r=document.body.createTextRange(); 
    r.moveToElementText(e); 
    r.select();}
  });
});
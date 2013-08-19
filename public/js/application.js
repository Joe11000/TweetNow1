$(function(){
  $('#blah').on('submit',function(e){
    $('#tweets').html("<img src='http://img29.imageshack.us/img29/2908/monkeydrummert.gif' />");
    e.preventDefault();
    var username = $(this).serialize();
    $.post('/tweets',username,function(response){
      console.log(response);
       $('#tweets').html(response);
       $('#blah input[type=text]').val('');
    });
  });


  $('a').on('click',function(e){
    $('#tweets').html("<img src='http://img29.imageshack.us/img29/2908/monkeydrummert.gif' />");
    e.preventDefault();
    var username = $.param({username:this.text});
    $.post('/tweets',username,function(response){
      console.log(response);
       $('#tweets').html(response);
    });
  });
 
});

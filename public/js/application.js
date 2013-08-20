$(function() {
  $('#sending_tweet_form_id').on('submit',function(e) {
    $('#tweets').html("<img src='http://img29.imageshack.us/img29/2908/monkeydrummert.gif' />");
    e.preventDefault();
    var tweet_body = $(this).serialize();
    $.post('/tweet', tweet_body, function(response) {
      console.log(response);
       $('#tweets').html("<h3>Tweet Sent!</h3>");
       $('#sending_tweet_form_id input[type=text]').val('');
    });
  });


  // $('a').on('click',function(e){
  //   $('#tweets').html("<img src='http://img29.imageshack.us/img29/2908/monkeydrummert.gif' />");
  //   e.preventDefault();
  //   var username = $.param({username:this.text});
  //   $.post('/tweets',username,function(response){
  //     console.log(response);
  //      $('#tweets').html(response);
  //   });
  // });
 
});


// $(function() {
//   $('#sending_tweet_form_id').on('submit',function(e) {
//     // $('#tweets').html("<img src='http://img29.imageshack.us/img29/2908/monkeydrummert.gif' />");
//     e.preventDefault();
//     var tweet_body = $(this).serialize();
//     $.post('/tweet', tweet_body, function(response) {
//       console.log(response);
//        $('#sending_tweet_form_id input[type=text]').val('');
//        $('#tweets').html("<h3 style='text-align:left; color:red;font-size:16px'>Tweet Sent!</h3>").animate({
//         opacity: .1,
//          color: blue,
//          text-align: right,
//           font-weight: 500 },
//          4000, function() {
//          /* stuff to do after animation is complete */
//        });
//     });
//   });

  $(document).ready(function () {
    // $("#profile").show(); // div not show on page load. trying this to explicitly load - haven't tried yet
    // $('#timeline').show();
    $('#friends-div').hide();
    $('#followers-div').hide();
    followersClicked();
    friendsClicked();
    brandClicked();
 });


  function followersClicked() {
    $("#followers").click(function(){
    $("#followers-div").show();
    $("#timeline").hide();
    $("#friends-div").hide();

 });
}

  function friendsClicked(){
    $("#friends").click(function(){
    $("#friends-div").show();
    $("#timeline").hide();
    $("#followers-div").hide();
 });
 }

 function brandClicked() {
    $(".navbar-brand").click(function(){
    $("#timeline").show();
    $("#followers-div").hide();
    $("#friends-div").hide();
  });
 }


  // $("#followers").click(function(){
  //   $("followers-div").show();
  // });
  //
  // $("#followers").click(function(){
  //   $("timeline").hide();
  // });
  //
  // $("#followers").click(function(){
  //   $("friends-div").hide();
  // });

  //

    // $("#friends").click(function(){
    //   $("friends-div").show();
    // });
    //
    // $("#friends").click(function(){
    //   $("timeline").hide();
    // });
    //
    // $("#friends").click(function(){
    //   $("followers-div").hide();
    // });


    // $(".navbar-brand").click(function(){
    //     $("#timeline").show();
    // });
    //
    // $(".navbar-brand").click(function(){
    //     $("#followers-div").hide();
    // });
    //
    // $(".navbar-brand").click(function(){
    //     $("#friends-div").hide();
    // });

// $('#small').id = "big";
// $('#big').id = "small";
// $('#small').append("hi");

$(document).ready(function() {
  $(".small").on("click", function(event) {
    var userId = $('.username').attr('id')
    var reviewId = this.parentElement.id
    event.preventDefault();
    // alert("hello");
    var request = $.ajax({
        url: ("/votes"),
        type: "POST",
        data: {
          vote: {
            user_id: userId,
            review_id: reviewId,
            up: false
          }
        },
        dataType: "json"
    });
    request.success(function(data) {
      // append data to your page
      // $("h1").html(data);
      var vote_buttons = this.parentElement.children;
      $(vote_buttons).toggleClass("voted");
      alert("hi");
    });
    request.error(function(data) {
      // append data to your page
      // $("h1").html(data);
    });

  });
});

// $("#small").click(function() {
//   alert("hello");
  // var request = $.ajax({
  //     url: "/votes",
  //     type: "POST",
  //     data: "hi"
  // });
  // request.success(function(data) {
  //   // append data to your page
  //   // $("h1").html(data);
  //   alert("made it!");
  // });
  // request.error(function(data) {
  //   // append data to your page
  //   // $("h1").html(data);
  //   alert("didn't make it!");
  // });
// });

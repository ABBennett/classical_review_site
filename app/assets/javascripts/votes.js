// $('#small').id = "big";
// $('#big').id = "small";
// $('#small').append("hi");

$(document).ready(function() {
  $(".voting").on("click", 'span', function(event) {
    event.preventDefault();
    var userId = $('.username').attr('id')
    var this_vote_container = this.parentElement;
    var reviewId = $(this_vote_container).attr('review_id')
    var request = $.ajax({
      url: ("/votes"),
      type: "POST",
      data: {
        vote: {
          user_id: userId,
          review_id: reviewId,
          up: $(this).attr("change_up_to")
        }
      }
    });

    request.success(function(data) {
      function create_span(up, plus_minus, class_name) {
        return '<span change_up_to="' + up + '" class="' + class_name +
        '"><a rel="nofollow" data-method="post" href="/votes?vote[review_id]=' +
        data.review_id + '&vote[up]=' + up + '">' + plus_minus + '</a></span>';
      };

      $("#review_id-" + reviewId + " span").remove();
      if (data.up === 1) {
        $("#review_id-" + data.review_id + " .voting").append(create_span(0, '+', 'voted' ));
        $("#review_id-" + data.review_id + " .voting").append(create_span(-1, ' -', 'nil_vote'));
      } else if (data.up === -1) {
        $("#review_id-" + data.review_id + " .voting").append(create_span(1, '+', 'nil_vote'));
        $("#review_id-" + data.review_id + " .voting").append(create_span(0, ' -', 'voted'));
      } else {
        $("#review_id-" + data.review_id + " .voting").append(create_span(1, '+', 'nil_vote'));
        $("#review_id-" + data.review_id + " .voting").append(create_span(-1, ' -', 'nil_vote'));
      };
    });
    request.error(function(data) {
      $(".flash").remove();
      error = data.responseText.replace(/error/, '').replace(/([{}":])/g, '');
      $(".topbar").after('<div class="flash">' + error + '</div>');
    });

  return false;
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
  //   // $("h-1").html(data);
  //   alert("made it!");
  // });
  // request.error(function(data) {
  //   // append data to your page
  //   // $("h-1").html(data);
  //   alert("didn't make it!");
  // });
// });

$(document).ready(function() {
  $(".voting").on("click", 'span', function(event) {
    event.preventDefault();
    var vote = $(this);
    var reviewId = vote.closest('.voting').attr('review_id');
    var up = vote.attr('change_up_to');
    var request = $.ajax({
      url: ("/votes"),
      type: "POST",
      data: {
        vote: {
          review_id: reviewId,
          up: up
        }
      }
    });

    request.success(function(data) {
      var vote_container = $("#review_id-" + data.review_id + " .voting");
      vote_container.children("span").remove();

      if (data.up === 1) {
        vote_container.append(create_span(0, '+', 'voted' ));
        vote_container.append(" " + create_span(-1, '-', 'nil_vote'));
      } else if (data.up === -1) {
        vote_container.append(create_span(1, '+', 'nil_vote'));
        vote_container.append(" " + create_span(0, '-', 'voted'));
      } else {
        vote_container.append(create_span(1, '+', 'nil_vote'));
        vote_container.append(" " + create_span(-1, '-', 'nil_vote'));
      };

      function create_span(up, plus_minus, class_name) {
        return '<span change_up_to="' + up + '" class="' + class_name +
        '"><a rel="nofollow" data-method="post" href="/votes?vote[review_id]=' +
        data.review_id + '&vote[up]=' + up + '">' + plus_minus + '</a></span>';
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

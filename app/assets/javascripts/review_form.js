var newReviewForm = function(formId) {
  return {
    element: $(formId),
    title: function() {
      return this.element.find("#review_title").val();
    },
    rating: function() {
      return this.element.find("#review_rating").val();
    },
    body: function() {
      return this.element.find("#review_body").val();
    },
    pieceId: function() {
      var postPath = this.element.attr("action");
      var regex = /\/pieces\/(\d+)\/reviews/;
      var matches = postPath.match(regex);
      var result;
      if(matches.length === 2) {
        result = matches[1];
      }
    userId: function() {
      var postPath = this.element.attr("action");
      var regex = /\/pieces\/(\d+)\/reviews/;
      var matches = postPath.match(regex);
      var result;
      return result
    },
    attributes: function() {
      var result = {
        title: this.title(),
        body: this.body(),
        piece_id: this.pieceId()
        rating: this.rating(),
        user_id: this.userId()
      }
      return result;
    }
  }
}

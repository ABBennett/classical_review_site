describe("ReviewForm", function() {
  var form = $('<form id="new_review" action="/pieces/2/reviews" method="post">');
  form.append('<input type="radio" value="1" name="review[rating]" id="review_rating_1">');
  form.append('<label for="review_rating_1">1</label>');
  form.append('<input type="radio" value="2" name="review[rating]" id="review_rating_2">');
  form.append('<label for="review_rating_2">2</label>');
  form.append('<input type="radio" value="3" name="review[rating]" id="review_rating_3">');
  form.append('<label for="review_rating_3">3</label>');
  form.append('<input type="radio" value="4" name="review[rating]" id="review_rating_4">');
  form.append('<label for="review_rating_4">4</label>');
  form.append('<input type="radio" value="5" name="review[rating]" id="review_rating_5">');
  form.append('<label for="review_rating_5">5</label>');
  form.append('<input type="radio" value="6" name="review[rating]" id="review_rating_6">');
  form.append('<label for="review_rating_6">6</label>');
  form.append('<input type="radio" value="7" name="review[rating]" id="review_rating_7">');
  form.append('<label for="review_rating_7">7</label>');
  form.append('<input type="radio" value="8" name="review[rating]" id="review_rating_8">');
  form.append('<label for="review_rating_8">8</label>');
  form.append('<input type="radio" value="9" name="review[rating]" id="review_rating_9">');
  form.append('<label for="review_rating_9">9</label>');
  form.append('<input type="radio" value="10" name="review[rating]" id="review_rating_10">');
  form.append('<label for="review_rating_10">10</label></div>');
  form.append('<input type="text" name="review[title]" id="review_title" />');
  form.append('<textarea name="review[body]" id="review_body"></textarea>');
  form.append('<input type="hidden" name="review[user_id]" id="review_user_id" value="99">' );
  form.find("#review_title").val("Cinematic Gold!");
  form.find("#review_rating_10").prop("checked", true);
  form.find("#review_body").val("You have to hear this piece yeahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfhuhchkhh");

  var reviewForm = newReviewForm(form);

  describe("new", function() {
    it("creates a new ReviewForm object", function() {
      expect(reviewForm).toBeDefined();
    });

    it("sets the element property", function() {
      expect(reviewForm.element).toBeDefined();
    });
  });

  describe("rating", function() {
    it("retrieves the rating from the form", function() {
      expect(reviewForm.rating()).toBe("10");
    });
  });

  describe("title", function() {
    it("retrieves the title from the form", function() {
      expect(reviewForm.title()).toBe("Cinematic Gold!");
    });
  });

  describe("body", function() {
    it("retrieves the title from the form", function() {
      expect(reviewForm.body()).toBe("You have to hear this piece yeahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfhuhchkhh");
    });
  });

  describe("pieceId", function() {
    it("retrieves the piece id from the form", function() {
      expect(reviewForm.pieceId()).toBe("2");
    });
  });

  describe("userId", function() {
    it("retrieves the user id from the form", function() {
      expect(reviewForm.userId()).toBe("99");
    });
  });

  describe("attributes", function() {
    it("returns an object of review attributes", function() {
      result = {
        title: "Cinematic Gold!",
        body: "You have to hear this piece yeahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfhuhchkhh",
        piece_id: "2",
        user_id: "99",
        rating: "10"
      }
      expect(reviewForm.attributes()).toEqual(result);
    });
  });
});


class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    mail(
      to: review.piece.user.email,
      subject: "New Review for #{review.piece.title}"
    )
  end
end

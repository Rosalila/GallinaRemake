class ReviewsController < ApplicationController
  def review_form
    @reviewed = Reviewed.find_by_id(params[:reviewed_id])
    @gallina = @reviewed.gallina
  end

  def review
    reviewer_id = current_user.id
    reviewed_id = params[:reviewed_id]
    @gallina = Gallina.find_by_id(params[:gallina_id])

    if !current_user.belongs_to_corralIMORTAL(@gallina.corral.id)
      redirect_to @gallina
      return
    end

    params[:questions].each do |question|
      review = Review.new
      review.user_id = current_user.id
      review.reviewed_id = reviewed_id
      review.question_id = question.first
      review.score = question.second
      review.save
    end

    redirect_to @gallina
  end
end

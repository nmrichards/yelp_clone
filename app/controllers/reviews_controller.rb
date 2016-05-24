class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(review_params)
    p @restaurant
    @restaurant.reviews.create(review_params)
  end

private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end

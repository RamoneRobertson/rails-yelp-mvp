class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]
  # User should be able to add a new review for a specific restaurant
  #----- GET 'restaurants/:id/'
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end

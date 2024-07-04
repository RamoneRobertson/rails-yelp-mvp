class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  # The user can see a list of all restaurants
  # ----- GET 'restaurants', to: 'restaurants#index'
  def index
    @restaurants = Restaurant.all
    # @images = Dir.glob("app/assets/images/restaurant-cards/*.jpg")
    # @image = @images.each do |path|
    #   path.split("/").last
    # end
  end

  def show
  end

  private
  def set_restaurant
    @restaunt = Restaurant.find(params[:id])
  end
end

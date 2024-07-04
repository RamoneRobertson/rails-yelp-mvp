class RestaurantsController < ApplicationController
  # The user can see a list of all restaurants
  # ----- GET 'restaurants', to: 'restaurants#index'
  def index
    @restaurants = Restaurant.all
  end
end

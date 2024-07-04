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

  # The user can view one restaurant
  # ----- GET 'restaurants/:id', to: 'restaurants#show'
  def show
    @description = Faker::Restaurant.description
    @reviews = @restaurant.reviews
    @user = Faker::Twitter.screen_name
  end

  # The user should be able to add a new restaurant to the site
  #----- GET 'restaurants/new', to: 'restaurants#new'
  def new
    @restaurant = Restaurant.new()
  end

  # Create the restaurnat in the db
  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  private
  # This method will sfind the current restaurant from the db using it's id
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end

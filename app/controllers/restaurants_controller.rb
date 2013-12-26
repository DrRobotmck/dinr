class RestaurantsController < ApplicationController
  
  def index
    @rest = Restaurant.all
    respond_to do |format|
      format.html
      format.json{render json: @rest}
    end
  end
   def show
      @rest = Restaurant.find(params[:id])
      lat_long = [@rest.long,@rest.lat]
      respond_to do |format|
        format.html
        format.json{render json: lat_long}
      end
    end
  def favorite
    @rest = Restaurant.find(params[:id])
    if current_user.favorite(@rest)
      redirect_to restaurant_path(@rest)
    else
      redirect_to restaurant_path(@rest)
    end
  end
  def unfavorite
    @rest = Restaurant.find(params[:id])
    if current_user.unfavorite(@rest)
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end
end
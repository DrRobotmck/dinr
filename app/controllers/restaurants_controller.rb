class RestaurantsController < ApplicationController
  
  def show
    @rest = Restaurant.find(params[:id])
    render :show
  end

  def index
    @rest = Restaurant.all
    render :index
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
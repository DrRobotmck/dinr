class RestaurantsController < ApplicationController

def show
  @rest = Restaurant.find(params[:id])
  render :show
end
def index
  @rest = Restaurant.all
  render :index
end

end
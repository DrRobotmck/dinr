class RestaurantsController < ApplicationController
  
  def index
    
    @a = "208.185.23.206"
    #@zip = request.location.postal_code
    @zip = params[:search]
    binding.pry
    if @zip == nil 
      @zip = "10011"
    end
    @rest = Restaurant.unique(@zip)
    binding.pry
    respond_to do |format|
      format.html
      format.json{render json: @rest}
    end
  end
   def show
      @rest = Restaurant.find(params[:id])
      i = Inspection.new
      @violations = i.get_result(@rest.camis)
      respond_to do |format|
        format.html
        #fix variable to make map show up
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
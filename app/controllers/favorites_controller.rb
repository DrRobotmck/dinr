class FavoritesController < ApplicationsController

  def index
    @favorites = User.find(params[:id]).favorites
    render :index
  end

  def create
    user = User.find(params[:id])
    user.favorites << restaurant
    user.save
  end
  
  def destroy
    user = User.find(params[:id])
    user.favorites(where name: )

  end


end
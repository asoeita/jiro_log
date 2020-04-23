class FavoritesController < ApplicationController
  before_action :logged_in_user
  def create
    @jiro = Jiro.find(params[:jiro_id])
    @jiro.like(current_user)
  end

  def destroy
    @jiro = Favorite.find(params[:id]).jiro
    @jiro.unlike(current_user)
  end



end

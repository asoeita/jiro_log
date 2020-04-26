class FavoritesController < ApplicationController
  before_action :set_variables

  def like
    like = current_user.favorites.new(jiro_id: @jiro.id)
    like.save
  end

  def unlike
    like = current_user.favorites.find_by(jiro_id: @jiro.id)
    like.destroy
  end

    private

    def set_variables
      @jiro = Jiro.find(params[:jiro_id])
      @id_name = "#like-link-#{@jiro.id}"
    end


end

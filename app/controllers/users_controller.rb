# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @jiros = Jiro.all
    @jiros = Jiro.page(params[:page]).per(8)
  end

  def new
  end

  def edit
    @user = current_user
  end

  def show
    @user = current_user
    # @jiros = Jiro.all
    @jiros = Jiro.where(user_id: @user.id)
    @jiros = Kaminari.paginate_array(@jiros).page(params[:page]).per(8)
    @j = @user.favorites.select("jiro_id")
    @favorites = Jiro.where(id: @j)
    @favorites = Kaminari.paginate_array(@favorites).page(params[:page]).per(8)

  end


  private
    #ストロングパラメーター
    def user_params
      params.require(:user).permit(:name, :email, :profile_picture, :password, :password_confirmation, :introduce)
    end

end

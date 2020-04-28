# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @jiros = Jiro.all.order(created_at: :desc)
    @jiros = Jiro.page(params[:page]).per(8).order(created_at: :desc)
    # @user = @user || User.find_by(id: session[:user_id])
    @user = current_user
  end

  def new
  end

  def edit
    # @user = @user || User.find_by(id: session[:user_id])
    @user = current_user
  end

  def show
    # @user = @user || User.find_by(id: session[:user_id])
    @user = current_user
    # @jiros = Jiro.all
    @jiros = Jiro.where(user_id: current_user.id)
    @jiros = Kaminari.paginate_array(@jiros).page(params[:page]).per(8)
    @j = current_user.favorites.select("jiro_id")
    @favorites = Jiro.where(id: @j)
    @favorites = Kaminari.paginate_array(@favorites).page(params[:page]).per(8)
  end


  private
    #ストロングパラメーター
    def user_params
      params.require(:user).permit(:name, :email, :profile_picture, :password, :password_confirmation, :introduce)
    end

end

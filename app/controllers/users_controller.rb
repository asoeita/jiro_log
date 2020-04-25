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
    @jiros = Jiro.all
    @jiros = Jiro.page(params[:page]).per(8)
    @jiro = Jiro.find_by(user_id: current_user.id)

  end


  private
    #ストロングパラメーター
    def user_params
      params.require(:user).permit(:name, :email, :profile_picture, :password, :password_confirmation, :introduce)
    end

end

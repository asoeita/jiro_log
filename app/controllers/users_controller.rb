# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :show]

    # if params[:q] == { sorts: 'updated_at_desc' }
    #   #検索フォームからアクセスしたときの処理
    #   @q = Jiro.ransack(search_params)
    #   @search = @q.result
    #   @jiros = Jiro.all
    #   @jiros = Jiro.page(params[:page]).per(8).order(created_at: :desc)
    # elsif params[:q] == { sorts: 'favorites_count_desc' }
    #   #検索フォーム以外からアクセスしたときの処理
    #   @q = Jiro.ransack()
    #   @jiros = Jiro.all
    #   @jiros = Jiro.page(params[:page]).per(8).order(favorites_count: :desc)

    # end
  # end

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

  #   if params[:hoge] == 1
  #     @jiros = Jiro.all
  #     @jiros = Jiro.page(params[:page]).per(8).order(created_at: :desc)
  #   elsif params[:hoge] == 2
  #     @jiros = Jiro.all
  #     @jiros = Jiro.page(params[:page]).per(8).order(favorites_count: :desc)
  #   end
  #     redirect_to 'users/search'
  # end
    # end
    # if params[:q].present?
    #   #検索フォームからアクセスしたときの処理
    #   @search = Jiro.ransack(search_params)
    #   @jiros = @search.result
    # else
    #   params[:q] = { sorts: 'id desc' }
    #   @search = Jiro.ransack()
    #   @jiros = Jiro.all
    # end
  # end



  private
    #ストロングパラメーター
    def user_params
      params.require(:user).permit(:name, :email, :profile_picture, :password, :password_confirmation, :introduce)
    end


    def search_params
      params.require(:q).permit(:sorts)
    end


end

class JirosController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def show
    @jiro = Jiro.find(params[:id])
    @poster  = User.find_by(id: @jiro.user_id)
    @store = Store.find_by(id: @jiro.store_id)
  end

  def new
    @jiro = Jiro.new
  end

  def create
    @user = current_user
    @jiro = @user.jiros.build(jiro_params)
    if @jiro.save
      flash[:success] = "投稿しました"
      redirect_to @user
    else
      render "jiros/new"
    end
  end

  # def search
  #   if params[:q].present?
  #     #検索フォームからアクセスしたときの処理
  #     @search = Jiro.ransack(search_params)
  #     @jiros = @search.result
  #   else
  #     params[:q] = { sorts: 'id desc' }
  #     @search = Jiro.ransack()
  #     @jiros = Jiro.all
  #   end
  # end

  private
    #ストロングパラメーター
    def jiro_params
      params.require(:jiro).permit(:picture, :store_id, :weather, :date, :waiting_time, :call, :pork, :soup, :comment, :favorites_count)
    end


    # def search_params
    #   params.require(:q).permit(:sorts)
    # end

end

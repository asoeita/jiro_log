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
    @jiro = current_user.jiros.build(jiro_params)
    if @jiro.save
      flash[:success] = "投稿しました"
      redirect_to current_user
    else
      render "jiros/new"
    end
  end

  private
    #ストロングパラメーター
    def jiro_params
      params.require(:jiro).permit(:picture, :store_id, :weather, :date, :waiting_time, :call, :pork, :soup, :comment)
    end

end

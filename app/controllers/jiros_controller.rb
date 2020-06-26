class JirosController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
      # if params[:option] == "A" || params[:option] == nil
      #   @jiros = Jiro.all.order('created_at DESC')
      # elsif params[:option] == "B"
      #   @jiros = Jiros.all.order('created_at ASC')
      # end
      @jiros = Jiro.all
      @jiros = Jiro.page(params[:page]).per(8).order(created_at: :desc)

      # @jiros_rank = Jiro.all.order(favorites_count: "DESC")
      # @user = @user || User.find_by(id: session[:user_id])
      @user = current_user

      @q = Jiro.ransack(params[:q])
      @jiross = @q.result(distinct: true)
  end

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

  def search
    @jiros = Jiro.all
    @jiros = Jiro.page(params[:page]).per(8).order(created_at: :desc)

    if params[:hoge] == "1"
      @jiros = Jiro.all
      @jiros = Jiro.page(params[:page]).per(8).order(created_at: :desc)
    elsif params[:hoge] == "2"
      @jiros = Jiro.all
      @jiros = Jiro.page(params[:page]).per(8).order(favorites_count: :desc)
    end

    if params[:q].present?
      #検索フォームからアクセスしたときの処理
      @q = Jiro.ransack(params[:q])
      @result = @q.result(distinct: true).page(params[:page]).per(8)
    else
      @q = Jiro.ransack(search_params)
      @result = @q.result(distinct: true)
    end
  end
    # render :index

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

    def search_params
      params.require(:q).permit(:name_cont)
    end

end

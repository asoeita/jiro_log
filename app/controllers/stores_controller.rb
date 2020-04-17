class StoresController < ApplicationController
  def create
    @store = Store.create(store_params)
  end


  private
    #ストロングパラメーター
    def store_params
      params.require(:store).permit(:name)
    end
  

end

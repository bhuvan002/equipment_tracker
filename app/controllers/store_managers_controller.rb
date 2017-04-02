class StoreManagersController < ApplicationController

  def show
    @store_manager = StoreManager.find(params[:id])
  end
end

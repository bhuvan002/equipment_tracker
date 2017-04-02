class StoreManagersController < ApplicationController
  # before_action :authenticate_store_manager!

  def show
    @store_manager = StoreManager.find(params[:id])
    @equipment = Equipment.new
    @requests = Equipment.where(request: true).paginate(page: params[:page])
  end
end

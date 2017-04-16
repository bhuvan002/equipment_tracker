class StoreManagersController < ApplicationController
  before_action :authenticate_user!

  def show
    @store_manager = StoreManager.find(params[:id])
    @equipment = Equipment.new
    @requests = Equipment.where(request: true)
  end
end

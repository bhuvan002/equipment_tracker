class SuperUsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @store_manager = SuperUser.find(params[:id])
    @requests = Equipment.where(request: true).paginate(page: params[:page])
  end
end

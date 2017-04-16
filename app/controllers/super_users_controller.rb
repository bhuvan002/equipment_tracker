class SuperUsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @store_manager = SuperUser.find(params[:id])
    @requests = Equipment.where(request: true)
    @move_requests = MoveRequest.all
  end
end

class LabOwnersController < ApplicationController
  before_action :authenticate_user!

  def show
    @lab_owner = LabOwner.find(params[:id])
    @equipment = Equipment.new
    @requests = current_user.equipment.where(request: true)
    @send_requests = current_user.send_requests
    @receive_requests = current_user.receive_requests
  end

  def index
    @lab_owners = LabOwner.all
  end
end

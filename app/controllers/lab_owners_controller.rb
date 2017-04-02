class LabOwnersController < ApplicationController
  before_action :authenticate_user!

  def show
    @lab_owner = LabOwner.find(params[:id])
    @equipment = Equipment.new
  end
end

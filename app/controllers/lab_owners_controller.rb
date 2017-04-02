class LabOwnersController < ApplicationController

  def show
    @lab_owner = LabOwner.find(params[:id])
    @equipment = Equipment.new
  end
end

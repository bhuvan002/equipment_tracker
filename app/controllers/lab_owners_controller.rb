class LabOwnersController < ApplicationController

  def show
    @lab_owner = LabOwner.find(params[:id])
  end
end

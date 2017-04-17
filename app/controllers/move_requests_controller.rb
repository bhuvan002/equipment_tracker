class MoveRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @move_request = current_user.send_requests.build(move_request_params)
    @equipment = @move_request.equipment
    @equipment.update_attributes(in_transit: true)
    if @move_request.save
      @equipment.save
      flash[:success] = "Move request created successfully!"
      redirect_to user_dashboard
    else
      flash[:danger] = "Move request could not be added!"
      redirect_to user_dashboard
    end
  end

  def update
    @move_request = MoveRequest.find(params[:id])
    @move_request.update_attributes(move_request_params)
    @move_request.save
    @move_request.move_equipment
    @move_request.equipment.update_location_history
    redirect_to user_dashboard
  end


  private
    def move_request_params
      params.require(:move_request).permit(:to_id, :equipment_id, :hod_approved, :to_approved)
    end

    def user_dashboard
      if current_user.nil?
        root_path
      elsif current_user.type == 'StoreManager'
        store_manager_path(current_user)
      elsif current_user.type == 'LabOwner'
        lab_owner_path(current_user)
      elsif current_user.type == 'SuperUser'
        super_user_path(current_user)
      end
    end
end

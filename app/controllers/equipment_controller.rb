class EquipmentController < ApplicationController
  before_action :authenticate_user!

  def create
    @equipment = Equipment.create(equipment_params)
    if @equipment.save
      flash[:success] = "Equipment added successfully"
      @equipment.update_location_history
      redirect_to user_dashboard
    else
      flash[:danger] = "Equipment could not be added"
      redirect_to user_dashboard
    end
  end

  def update
    @equipment = Equipment.find(params[:id])
    @equipment.update_attributes(equipment_params)
    @equipment.save
    @equipment.update_location_history
    redirect_to user_dashboard
  end

  def show
    @equipment = Equipment.find(params[:id])
    @location_histories = @equipment.location_histories.order(created_at: :desc)
  end


  def index
    if (current_user.type == 'LabOwner')
      @equipment = current_user.equipment.where(request: false)
      @move_request = MoveRequest.new
    else
      @equipment = Equipment.where(request: false)
    end
  end

  private
    def equipment_params
      params.require(:equipment).permit(:model, :kind, :request, :approved, :location,
      :lab_owner_id, :status, :warranty_status)
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

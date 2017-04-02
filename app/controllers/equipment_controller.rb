class EquipmentController < ApplicationController
  before_action :authenticate_user!

  def create
    @equipment = Equipment.create(equipment_params)
    if @equipment.save
      flash[:success] = "Equipment added successfully"
      redirect_to user_dashboard
    else
      flash[:danger] = "Equipment could not be added"
      redirect_to user_dashboard
    end
  end

  def index
    @equipment = Equipment.where(request: false).paginate(page: params[:page])
  end

  private
    def equipment_params
      params.require(:equipment).permit(:model, :kind, :request, :approved, :location)
    end

    def user_dashboard
      if current_user.nil?
        root_path
      elsif current_user.type == 'StoreManager'
        store_manager_path(current_user)
      elsif current_user.type == 'LabOwner'
        lab_owner_path(current_user)
      end
    end
end

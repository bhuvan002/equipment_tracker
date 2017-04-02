class EquipmentController < ApplicationController
  before_action :authenticate_user!

  def create
    @equipment = Equipment.create(equipment_params)
    if @equipment.save
      flash[:success] = "Equipment added successfully"
      redirect_to store_manager_path(current_user)
    else
      flash[:danger] = "Equipment could not be added"
      redirect_to store_manager_path(current_user)
    end
  end

  def index
    @equipment = Equipment.paginate(page: params[:page])
  end

  private
    def equipment_params
      params.require(:equipment).permit(:model, :kind)
    end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    # user_path(resource)
    if resource.type == 'StoreManager'
      store_manager_path(resource)
    elsif resource.type == 'LabOwner'
      lab_owner_path(resource)
    elsif resource.type == 'SuperUser'
      super_user_path(resource)
    else
      user_path(resource)
    end
  end
end

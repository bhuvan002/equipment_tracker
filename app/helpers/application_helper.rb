module ApplicationHelper
  
  def full_title(name="")
    base_title = "Equipment Tracker"
    if name.blank?
      title = base_title   
    else
      title = "#{name} | #{base_title}"
    end
  end

  def is_super_user?
    user_signed_in? && current_user.type == 'SuperUser'
  end

  def is_store_manager?
    user_signed_in? && current_user.type == 'StoreManager'
  end

  def is_lab_owner?
    user_signed_in? && current_user.type == 'LabOwner'
  end
end

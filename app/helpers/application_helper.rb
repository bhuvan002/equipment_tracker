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
end

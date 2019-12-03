class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
      when User
        edit_users_user_info_path(current_user.id)
    end
  end
end

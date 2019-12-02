class Users::BaseController < ApplicationController
  before_action authenticate_user!
  before_action :set_up

  layout 'render_users'

  private
    def set_up
      @user = current_user
    end

    def fg_check
      if controller_name != 'edit_passwords' && @user.set_fg == true
        redirect_to edit_users_edit_password_path(@user)
      end
    end
end


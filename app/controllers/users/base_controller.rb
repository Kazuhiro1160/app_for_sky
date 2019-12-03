class Users::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_up
  before_action :fog_check

  layout 'render_users'

  private
    def set_up
      @user = current_user
    end

    def fog_check
      if controller_name != 'edit_passwords' && @user.pass_fog == true
        redirect_to edit_users_edit_password_path(@user.id)
      end
    end
end


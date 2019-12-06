class Users::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_up
  before_action :fg_check

  layout 'render_users'

  private
    def set_up
      @user = current_user
    end

    def fg_check
      if controller_name != 'edit_passwords' &&  @user.pass_fg == true
        redirect_to edit_users_edit_password_path(@user.id)
      elsif controller_name != 'edit_passwords' && controller_name != 'user_infos' &&  @user.set_fg == true
        redirect_to edit_users_user_info_path(@user.id)
      end
    end
end


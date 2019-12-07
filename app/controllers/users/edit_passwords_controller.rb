class Users::EditPasswordsController < Users::BaseController
  layout 'render_users_modern'
  def edit
    if @user.pass_fg == false
      redirect_to errors_index_path
    end
  end

  def update
    if params[:part][:usr_password] == params[:part][:password_conf]
      if @user.update(password: params[:part][:usr_password], pass_fg: false)
        sign_in(@user, bypass: true)
        redirect_to edit_users_user_info_path(current_user.id)
      elsif params[:part][:usr_password].size < 6
        redirect_to action: :edit, notice: 'パスワードは6文字以上の半角英数字です。'
      elsif params[:part][:usr_password].size > 14
        redirect_to action: :edit, notice: 'パスワードは14文字以下の半角英数字です。'
      end
    else
      redirect_to action: :edit, notice: 'パスワードが一致しませんでした。'
    end
  end
end

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    # bindig.break
    myuser = User.find_by(email: params[:user][:email])
    if myuser.nil?
      flash[:notice] = 'Email not found'
      redirect_to new_user_session_path
    elsif myuser.valid_password?(params[:user][:password])
      flash[:notice] = 'Welcome back!'
      super
    else
      flash[:notice] = 'Incorrect password'
      redirect_to new_user_session_path
    end
  end

  # DELETE /resource/sign_out
  def destroy
    sign_out(current_user)
    redirect_to root_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    muser = User.find_by(email: params[:user][:email])
    if muser.nil?
      muser = User.new({
                         name: params[:user][:name],
                         email: params[:user][:email],
                         password: params[:user][:password],
                         password_confirmation: params[:user][:password_confirmation]
                       })
      if muser.save
        flash[:notice] = 'Successfully registered'
        sign_in(muser)
        redirect_to root_path
      else
        flash[:notice] = muser.errors.full_messages.to_sentence
        redirect_to new_user_registration_path
      end
    else
      flash[:notice] = 'Email already exists'
      redirect_to new_user_registration_path
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

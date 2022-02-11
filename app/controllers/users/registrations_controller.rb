class Users::RegistrationsController < Devise::RegistrationsController
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
end

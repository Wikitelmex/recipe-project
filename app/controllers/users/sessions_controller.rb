class Users::SessionsController < Devise::SessionsController
  def create
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

  def destroy
    sign_out(current_user)
    redirect_to root_path
  end
end

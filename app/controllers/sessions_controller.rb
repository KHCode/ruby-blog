class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(session_params[:email]) || User.new(session_params)
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  private
    def session_params
      params.permit(:email, :password)
    end
end

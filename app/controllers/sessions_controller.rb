class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [ :new, :create ]
  before_action :redirect_if_authenticated, only: [ :new, :create ]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path, flash: { success: "Logged in successfully" }
    else
      redirect_to new_session_path, flash: { alert: "Correo electrónico o contraseña incorrectos" }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { success: "Logged out" }
  end
end

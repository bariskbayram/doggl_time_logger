class RegistrationsController < ApplicationController

  def new
    if @current_user
      redirect_to entries_path
    else
      @user = User.new
    end
  end
  
  def create
    @user = User.create!(
      email: params["user"]["email"],
      password: params["user"]["password"],
      password_confirmation: params["user"]["password_confirmation"],
      is_admin: params["user"]["is_admin"]
    )

    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account is created!"  
    else
      render :new, notice: "Invalid informations!"
    end
  end

end
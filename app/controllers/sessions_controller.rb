# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    redirect_to entries_path if @current_user
  end

  def create
    user = User
           .find_by(email: params['email'])
           .try(:authenticate, params['password'])

    if user
      session[:user_id] = user.id
      redirect_to entries_path, notice: 'Logged in Successfully!'
    else
      render :new, notice: 'Invalid email or password!'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logged Out!'
  end
end

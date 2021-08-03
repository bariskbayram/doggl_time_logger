class UsersController < ApplicationController
  before_action :set_users

  def index
    if @log_type.nil?
      @log_type = "Monthly" 
    end
  end

  def report
    @log_type = params["log_type"]["id"]
    render :index
  end

  private
    def set_users
      @users = User.all
    end
end
# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_users

  def index
    @log_type = 'Monthly' if @log_type.nil?
  end

  def report
    @log_type = params['log_type']['id']
    render :index
  end

  private

  def set_users
    @users = User.all
  end
end

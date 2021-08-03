class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def is_user_logged_in
    redirect_to login_path, alert: 'You must be signed in' if @current_user.nil?
  end

  def is_user_admin
    @current_user.nil? && @current_user.is_admin
  end

  def time_value(params, field)
    Time.zone.local(*(1..5).map { |i| params["#{field}(#{i}i)"] })
  end

end

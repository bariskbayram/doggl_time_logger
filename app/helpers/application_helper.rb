# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def current_user_is_admin
    user_is_logged_in && @current_user.is_admin
  end

  def user_is_logged_in
    !@current_user.nil?
  end
end

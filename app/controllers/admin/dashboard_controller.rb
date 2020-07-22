class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with username: ENV["USER_NAME"], password: ENV["PASSWORD"]
  def show
  end
end

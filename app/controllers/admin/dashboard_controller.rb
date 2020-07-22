class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USER_NAME"], password: ENV["PASSWORD"]
  
  def show
    puts ENV["USER_NAME"]
    puts ENV["PASSWORD"]

    @products = Product.order(id: :desc).all
    @categories = Category.all
  end
end

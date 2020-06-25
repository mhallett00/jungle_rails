class Admin::DashboardController < ApplicationController
  def show
  end

  def category_count
    @categories = Category.all.count
  end
  helper_method :category_count
  
  def product_count

    @products = Product.all.count
    
  end
  helper_method :product_count

end

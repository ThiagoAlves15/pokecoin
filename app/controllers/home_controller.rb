class HomeController < ApplicationController
  def index
    @last_sales = Sale.where('to_user_id IS NOT null').last(10)
    @last_offers = Sale.where('to_user_id IS null').last(10)
  end
end
class HomeController < ApplicationController
  def index
    @last_sales = Sale.where('to_user_id IS NOT null').last(10)
    @last_offers = Sale.where('to_user_id IS null').last(10)
    @last_sat_usd = Rate.sat_to_usd_rate
    @total_wallet_value = current_user.total_wallet_value if current_user
    @last_rates = Rate.last(10)
  end
end
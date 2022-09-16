class ApplicationController < ActionController::Base
  before_action :set_total_wallet_value, :if => :signed_in?

  def set_total_wallet_value
    @total_wallet_value = current_user.total_wallet_value
  end
end

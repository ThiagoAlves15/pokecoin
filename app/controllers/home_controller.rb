class HomeController < ApplicationController
  def index
    @last_sales = Sale.where('to_user_id IS NOT null').last(10)
    @last_offers = Sale.where('to_user_id IS null').last(10)
    @btc_usd = get_btc_to_usd_rate
  end

  private

    def get_btc_to_usd_rate
      uri = URI("https://rest.coinapi.io/v1/exchangerate/BTC/USD")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.path, {
        'Content-Type' => 'application/json',
        'X-CoinAPI-Key' => '1712987B-90C8-4883-AA6C-3D3671DF80A7'
      })
      response = http.request(request)

      binding.pry

      return nil if response.code != '200'

      JSON.parse(response.body)
    end
end
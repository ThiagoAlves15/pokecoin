class Rate < ApplicationRecord
  class << self
    def sat_to_usd_rate
      rate = Rate.where('created_at >= ?', 10.minutes.ago).take

      unless rate
        rate = get_updated_sat_to_usd_rate
      end

      rate
    end

    private

    def get_updated_sat_to_usd_rate
      uri = URI("https://rest.coinapi.io/v1/exchangerate/BTC/USD")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.path, {
        'Content-Type' => 'application/json',
        'X-CoinAPI-Key' => ENV["COIN_API_KEY"]
      })
      response = http.request(request)

      return if response.code != '200'

      satoshi = JSON.parse(response.body)['rate'].to_f / 100000000
      rate = Rate.new(rate: satoshi)
      rate.save!

      rate
    end
  end
end

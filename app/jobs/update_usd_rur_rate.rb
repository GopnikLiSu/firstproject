require 'net/http'

class UpdateUsdRurRate < ApplicationJob

  def perform
    begin
      url = URI.parse('http://www.cbr-xml-daily.ru/daily_json.js')
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      hash = JSON.parse(res.body)
      rate = hash["Valute"]["USD"]["Value"]

      if (Time.now - Usd.order(:created_at).last.created_at) > 1.days
        usd = Usd.new
        usd.rate = rate
        usd.date = Time.now
        usd.save
      end
    rescue Exception => e
        Rails.logger.info "Buy good: error in ensure block #{e.message}"
    end
  end
end

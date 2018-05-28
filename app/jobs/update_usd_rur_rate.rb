require 'net/http'
require 'json'

class UpdateUsdRurRate < ApplicationJob

  def perform
    if (Time.now - Usd.order(:created_at).last.created_at) > 1.day
      begin
        url = URI.parse('http://www.cbr-xml-daily.ru/daily_json.js')
        req = Net::HTTP::Get.new(url.to_s)
        # REVU: The same thing about brackets vs do-end
        res = Net::HTTP.start(url.host, url.port) do |http|
          http.request(req)
        end
        hash = JSON.parse(res.body)
        rate = hash['Valute']['USD']['Value']

        usd = Usd.new
        usd.rate = rate
        usd.date = Time.now
        usd.save!
      end
    end
  end
end

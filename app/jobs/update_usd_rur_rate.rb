require 'net/http'
require 'json'

class UpdateUsdRurRate < ApplicationJob

  def perform
    if (Time.now - Usd.order(:created_at).last.created_at) > 1.day
      begin
        url = URI.parse('https://www.cbr-xml-daily.ru/daily_json.js')
        req = Net::HTTP::Get.new(url.to_s)
        # REVU: The same thing about brackets vs do-end
        res = Net::HTTP.start(url.host, url.port) do |http|
          http.request(req)
        end
        hash = JSON.parse(res.body)
        # REVU: Use '' instead of "" when interpolation is not used
        rate = hash["Valute"]["USD"]["Value"]

        # REVU: 1.day sounds better than 1.days =)

        usd = Usd.new
        usd.rate = rate
        usd.date = Time.now
        # REVU: Consider using save! method when you don't need the result of save
        # REVU: save return boolean value telling us whether saving was successful or not
        usd.save!
      end
      # REVU: Do not rescue Exception, it is global exception that does not provide any information
      # REVU: The more strict exception is, the more it's valuable
    end
  end
end

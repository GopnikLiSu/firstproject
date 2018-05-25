require 'net/http'
require 'json'

class UpdateRate < ApplicationJob
  def perform
      if (Time.now - Usd.order(:created_at).last.created_at) > 1.day
        begin
          url = URI.parse('https://www.cbr-xml-daily.ru/daily_json.js')
          req = Net::HTTP::Get.new(url.to_s)
          res = Net::HTTP.start(url.host, url.port) do |http|
            http.request(req)
        end
        hash = JSON.parse(res.body)
        rate = hash['Valute']['USD']['Value']

        usd_rur = Rate.new
        usd_rur.rate = rate
        usd_rur.curr_1 = 'USD'
        usd_rur.curr_2 = 'RUR'
        # REVU: Consider using save! method when you don't need the result of save
        # REVU: save return boolean value telling us whether saving was successful or not
        usd_rur.save!
      end
  end
end

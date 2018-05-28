require 'net/http'
require 'json'

class UpdateRate < ApplicationJob
  def perform
      if (Time.now - Usd.order(:created_at).last.created_at) > 1.day
        url = URI.parse('http://www.cbr-xml-daily.ru/daily_json.js')
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) do |http|
          http.request(req)
        end
        hash = JSON.parse(res.body)

        rate_u = hash['Valute']['USD']['Value']
        usd_rur = Rate.new
        usd_rur.rate = rate_u
        usd_rur.curr_1 = 'USD'
        usd_rur.curr_2 = 'RUR'
        usd_rur.save!

        rate_e = hash['Valute']['EUR']['Value']
        eur_rur = Rate.new
        eur_rur.rate = rate_e
        eur_rur.curr_1 = 'EUR'
        eur_rur.curr_2 = 'RUR'
        eur_rur.save!

        rate_c = hash['Valute']['CNY']['Value']
        eur_rur = Rate.new
        eur_rur.rate = rate_c
        eur_rur.curr_1 = 'CNY'
        eur_rur.curr_2 = 'RUR'
        eur_rur.save!

        rate_j = hash['Valute']['JPY']['Value']
        eur_rur = Rate.new
        eur_rur.rate = rate_j
        eur_rur.curr_1 = 'JPY'
        eur_rur.curr_2 = 'RUR'
        eur_rur.save!
    end
  end
end

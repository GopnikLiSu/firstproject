module HomeHelper
  require 'rubygems'
  require 'json'
  require 'net/http'
  def cbrf_usd_rur_rate
    url = URI.parse('http://www.cbr-xml-daily.ru/daily_json.js')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    h = JSON.parse(res.body)
    h["Valute"]["USD"]["Value"]
  end
end

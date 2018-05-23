module HomeHelper
  require 'rubygems'
  require 'json'
  require 'net/http'
  # REVU: Code is not used
  def cbrf_usd_rur_rate
    url = URI.parse('http://www.cbr-xml-daily.ru/daily_json.js')
    req = Net::HTTP::Get.new(url.to_s)
    # REVU: Brackets are used inline e.g. res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
    # REVU: In multiline cases use do-end e.g.
    # REVU: res = Net::HTTP.start(url.host, url.port) do |http|
    # REVU:   http.request(req)
    # REVU: end
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    h = JSON.parse(res.body)
    h["Valute"]["USD"]["Value"]
  end
end

class HomeController < ApplicationController
  include HomeHelper

  def index
    #@rate_data = cbrf_usd_rur_rate
    #@last_10_rate = Usd.last(10)
    @last_10_rate = Usd.last(10).map{|x| [x.date.to_s.gsub('-', '.').split('.').reverse.join('.'), x.rate.to_f]}
    @last_10_rate_min = @last_10_rate.min{|a, b| a[1] <=> b[1]}[1] - 0.5
    @last_10_rate_max = @last_10_rate.max{|a, b| a[1] <=> b[1]}[1] + 0.5
  end
end

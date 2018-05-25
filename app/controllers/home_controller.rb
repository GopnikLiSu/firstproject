class HomeController < ApplicationController
  include HomeHelper
  before_action :authenticate_user!

  def index
    @user = current_user
  #  @last_10_rate = Usd.last(10).map{|x| [x.date.to_s.gsub('-', '.').split('.').reverse.join('.'), x.rate.to_f]}
  #  @last_10_rate_min = @last_10_rate.min{|a, b| a[1] <=> b[1]}[1] - 0.5
  #  @last_10_rate_max = @last_10_rate.max{|a, b| a[1] <=> b[1]}[1] + 0.5
  end

  def my_currency
    @user = current_user
    #@user.rates.delete(@user.rates.last)
    #@user.rates << Rate.last(5)
    if @user.rates.count == 0
      @user_rates = Rate.last(5)
    else
      @user_rates = @user.rates
    end
  end
end

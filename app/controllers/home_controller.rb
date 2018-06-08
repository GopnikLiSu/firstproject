class HomeController < ApplicationController
  include HomeHelper
  before_action :authenticate_user!

  def index
  #  @user = current_user
  #  @last_10_rate = Usd.last(10).map{|x| [x.date.to_s.gsub('-', '.').split('.').reverse.join('.'), x.rate.to_f]}
  #  @last_10_rate_min = @last_10_rate.min{|a, b| a[1] <=> b[1]}[1] - 0.5
  #  @last_10_rate_max = @last_10_rate.max{|a, b| a[1] <=> b[1]}[1] + 0.5
  end

  def currencies
    #Вытащить это в хэлпер, чтобы не засорять контроллер
    @user = current_user
    #@user.rates.delete(@user.rates.all)
    r = Rate.order(:created_at).last(4)
    sub = @user.subscribes
    output = []
    sub.each{|w| output << r.detect{|v| v.curr_1 == w.first && v.curr_2 == w[1] }}
    if output.count == 0
      @user_rates = Rate.last(5)
    else
      @user_rates = output
    end
  end

  def settings
    @subs = CurrencySubscribe.all
  end

  def change_settings
    #You need to REQUIRE ADMIN to use this method!
    current_user.subscribes = User.where(:id => params["user_id"]).last
    sub = params['subscribed'] || false
    user.save!

    redirect_to '/currencies/settings'
  end
end

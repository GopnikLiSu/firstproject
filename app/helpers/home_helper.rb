module HomeHelper
  def check_sub(sub_id)
    user_subs = current_user.subscribes
    test_sub = CurrencySubscribe.where(:id => sub_id).first
    user_subs.detect{|v| test_sub.currency_denominator == v.first && test_sub.currency_numerator == v[1]}.present?
  end
end

class CreateCurrencySubscribes < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_subscribes do |t|
      t.string :currency_denominator
      t.string :currency_numerator
    end
  end
end

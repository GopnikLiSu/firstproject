class CreateRatesCategoriesJoinTable < ActiveRecord::Migration[5.2]
  def change
  create_join_table :rates, :users do |t|
    t.index :rate_id
    t.index :user_id
  end
end
end

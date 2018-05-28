class AddSubscribesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscribes, :text, :default => [
        ['USD', 'RUR', 1],
        ['EUR', 'RUR', 1],
        ['CNY', 'RUR', 1],
        ['JPY', 'RUR', 1]
    ], array:true
  end
end

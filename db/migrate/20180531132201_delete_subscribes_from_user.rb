class DeleteSubscribesFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :subscribes
  end
end

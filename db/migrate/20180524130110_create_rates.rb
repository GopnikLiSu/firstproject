class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|

      t.float :rate
      t.string :curr_1
      t.string :curr_2

      t.timestamps
    end
  end
end

class CreateUsds < ActiveRecord::Migration[5.2]
  def change
    create_table :usds do |t|
      t.string :rate
      t.date :date

      t.timestamps
    end
  end
end

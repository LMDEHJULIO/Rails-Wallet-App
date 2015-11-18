class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :number
      t.string :card_type
      t.integer :expiration_month
      t.integer :expiration_year
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :expiration_date

      t.timestamps null: false
    end
  end
end

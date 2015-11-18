class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :fname
      t.string :lname
      t.decimal :balance
      t.datetime :created_at
      t.datetime :updated_at
      t.string :phone
      t.text :password

      t.timestamps null: false
    end
  end
end

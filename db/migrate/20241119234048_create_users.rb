class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password
      t.references :role, null: false, foreign_key: true
      t.datetime :entryDate

      t.timestamps
    end
  end
end

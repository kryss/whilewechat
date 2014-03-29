class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :company
      t.string :email
      t.string :school
      t.string :grade
      t.string :city
      t.string :country
      t.string :phone
      t.text :about

      t.timestamps
    end
  end
end

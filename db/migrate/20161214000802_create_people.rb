class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :party
      t.string :description
      t.string :role_type
      t.string :address
      t.string :contact
      t.string :phone
      t.string :website
      t.integer :identification
      t.integer :state_id

      t.timestamps
    end
  end
end

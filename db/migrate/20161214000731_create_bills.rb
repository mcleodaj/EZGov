class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :name
      t.string :full_bill
      t.string :bill_type
      t.string :is_alive
      t.string :is_current
      t.string :current_status
      t.string :current_status_date
      t.string :introduced_date
      t.integer :identification
      t.integer :sponsor_id
      
      t.timestamps
    end
  end
end

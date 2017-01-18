class CreateTrackedPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :tracked_people do |t|
      t.integer :user_id
      t.integer :person_id

      t.timestamps
    end
  end
end

class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.string :vote
      t.string :vote_type
      t.string :vote_chamber
      t.string :question
      t.string :vote_date
      t.integer :person_id
      t.integer :bill_id

      t.timestamps
    end
  end
end

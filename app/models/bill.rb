class Bill < ApplicationRecord
  has_many :votes
  has_many :people, through: :votes
  has_many :trackedBills
  has_many :users, through: :trackedBills
  belongs_to :sponsor, class_name: "Person"
end

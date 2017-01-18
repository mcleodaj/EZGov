class Person < ApplicationRecord
  belongs_to :state
  has_many :votes
  has_many :bills, through: :votes
  has_many :trackedPeople
  has_many :users, through: :trackedPeople
  has_many :sponsored_bills, class_name: "Bill", foreign_key: "sponsor_id"
end

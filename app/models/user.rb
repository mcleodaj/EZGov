class User < ApplicationRecord
  belongs_to :state
  has_many :trackedBills
  has_many :bills, through: :trackedBills
  has_many :trackedPeople
  has_many :people, through: :trackedPeople

  validates :email, :encrypted_password, {presence: true}
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end

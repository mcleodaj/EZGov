module V1
  class PersonSerializer < ActiveModel::Serializer
    attributes :id, :firstname, :lastname, :gender, :party, :description, :role_type, :address, :contact, :phone, :website, :identification
    has_one :state, serializer: V1::StateSerializer
    has_many :votes, serializer: V1::VoteSerializer
    has_many :sponsored_bills, serializer: V1::BillSerializer
  end
end

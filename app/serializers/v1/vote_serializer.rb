module V1
  class VoteSerializer < ActiveModel::Serializer
    attributes :id, :vote, :vote_type, :vote_chamber, :question, :vote_date
    has_one :person, serializer: V1::PersonSerializer
    has_one :bill, serializer: V1::BillSerializer
  end
end

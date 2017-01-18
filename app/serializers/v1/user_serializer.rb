module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :username
    has_many :tracked_bills, serializer: V1::TrackedBillSerializer
    has_many :tracked_people, serializer: V1::TrackedPersonSerializer
  end
end

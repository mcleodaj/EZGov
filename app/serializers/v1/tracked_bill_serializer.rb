module V1
  class TrackedBillSerializer < ActiveModel::Serializer
    attributes :id
    has_one :bill, serializer: V1::BillSerializer
    has_one :user, serializer: V1::UserSerializer
  end
end

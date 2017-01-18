module V1
  class TrackedPersonSerializer < ActiveModel::Serializer
    attributes :id
    has_one :person, serializer: V1::PersonSerializer
    has_one :user, serializer: V1::UserSerializer
  end
end

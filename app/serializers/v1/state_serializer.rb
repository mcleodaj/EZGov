module V1
  class StateSerializer < ActiveModel::Serializer
    attributes :id, :name, :abbr
    has_many :people, serializer: V1::PersonSerializer
  end
end

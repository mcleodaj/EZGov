module V1
  class BillSerializer < ActiveModel::Serializer
    attributes :id, :name, :full_bill, :bill_type, :is_alive, :is_current, :current_status, :current_status_date, :introduced_date
    has_one :sponsor, serializer: V1::PersonSerializer
  end
end

class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  extend Enumerize

  field :order_number, type: String
  field :judge, type: String
  field :ordered_at, type: Date
  field :order_details, type: String
  field :latest_order, type: String
  field :link, type: String
  field :order_type, type: String

  enumerize :order_type, in: [:daily, :final, :regular]

  belongs_to :case, inverse_of: :orders
end

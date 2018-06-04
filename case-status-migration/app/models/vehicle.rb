class Vehicle
  include Mongoid::Document
  include Mongoid::Timestamps

  field :vehicle, type: String
  field :number, type: String
  field :accident_on, type: Date

  belongs_to :case, inverse_of: :vehicles
end

class UsrDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  field :usr_number, type: String
  field :usr_type, type: String
  field :filing_date, type: Date

  belongs_to :advocate, inverse_of: :usr_details
  belongs_to :case, inverse_of: :usr_details
end

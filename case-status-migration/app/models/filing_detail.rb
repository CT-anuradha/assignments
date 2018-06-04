class FilingDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  field :filing_number, type: String
  field :court_fees, type: String
  field :filed_at, type: Date
  field :case_number, type: String

  belongs_to :case, inverse_of: :filing_details
end

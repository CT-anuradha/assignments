class CaseDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  field :case_number, type: String
  field :registered_on, type: Date
  field :register_number, type: String
  field :filing_number, type: String
  field :filed_at, type: Date
  field :court_fees, type: String

  index({ case_number: 1 })

#   validates :case_number, presence: true

  belongs_to :case, inverse_of: :case_details
end

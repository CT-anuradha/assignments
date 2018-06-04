class CaseDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  field :case_number, type: String
  field :registered_on, type: Date
  field :filing_no, type: String
  field :filed_at, type: Date

  index({ case_number: 1 }, { unique: false, background: true })

  belongs_to :case, inverse_of: :case_details
end

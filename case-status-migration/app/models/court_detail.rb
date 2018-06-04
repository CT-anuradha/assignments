class CourtDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  field :case_number, type: String
  field :court_name, type: String
  field :ordered_at, type: Date

  index({ case_number: 1 }, { unique: false, background: true })

  has_many :case_court_details, inverse_of: :court_detail, autosave: true
end

class LowerCourtDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  field :case_number, type: String
  field :judgeship, type: String
  field :place, type: String
  field :court, type: String
  field :decision_at, type: Date

  index({ case_number: 1 }, { unique: false, background: true })

  validates :place, uniqueness: { case_sensitive: false }

  belongs_to :case, inverse_of: :lower_court_details
end

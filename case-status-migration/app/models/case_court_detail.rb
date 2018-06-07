class CaseCourtDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  index({ case_id: 1 })
  index({ court_detail_id: 1 })
  index({ case_id: 1, court_detail_id: 1}, { unique: true, background: true })

  validates :case_id, :court_detail_id, presence: true

  belongs_to :court_detail, inverse_of: :case_court_details
  belongs_to :case, inverse_of: :case_court_details
end

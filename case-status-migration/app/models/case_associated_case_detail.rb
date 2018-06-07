class CaseAssociatedCaseDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  index({ case_id: 1 })
  index({ associated_case_detail_id: 1 })
  index({ case_id: 1, associated_case_detail_id: 1 }, {unique: true, background: true})

  validates :case_id, :associated_case_detail_id, presence: true

  belongs_to :associated_case_detail, inverse_of: :case_associated_case_details
  belongs_to :case, inverse_of: :case_associated_case_details
end

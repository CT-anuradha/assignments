class CaseJudge
  include Mongoid::Document
  include Mongoid::Timestamps

  index({ case_id: 1 })
  index({ judge_id: 1 })
  index({ case_id: 1, judge_id: 1}, { unique: true, background: true })

  validates :case_id, :judge_id, presence: true

  belongs_to :case, inverse_of: :case_judges
  belongs_to :judge, inverse_of: :case_judges
end

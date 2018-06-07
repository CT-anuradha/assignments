class CaseAct
  include Mongoid::Document
  include Mongoid::Timestamps

  index({ act_id: 1 }, { unique: false, background: true })
  index({ case_id: 1 }, { unique: false, background: true })
  index({ act_id: 1, case_id: 1}, { unique: true, background: true })

  validates :act_id, :case_id, presence: true

  belongs_to :act, inverse_of: :case_acts
  belongs_to :case, inverse_of: :case_acts
end

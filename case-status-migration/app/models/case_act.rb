class CaseAct
  include Mongoid::Document
  include Mongoid::Timestamps

  index({ act_id: 1 }, { unique: false, background: true })
  index({ case_id: 1 }, { unique: false, background: true })

  belongs_to :act, inverse_of: :case_acts, optional: true
  belongs_to :case, inverse_of: :case_acts
end

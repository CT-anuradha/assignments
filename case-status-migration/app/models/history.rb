class History
  include Mongoid::Document
  include Mongoid::Timestamps

  field :next_hearing, type: Date
  field :register_number, type: String
  field :last_hearing, type: Date
  field :status, type: String

  index({ judge_id: 1 })
  index({ case_id: 1 })

  belongs_to :case, inverse_of: :histories
  belongs_to :judge, inverse_of: :histories
end

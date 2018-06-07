class SubCase
  include Mongoid::Document
  include Mongoid::Timestamps

  field :sub_case_type, type: String
  field :sub_case_number, type: String

  index({ sub_case_type: 1 }, { unique: false, background: true })
  index({ sub_case_number: 1 }, { unique: false, background: true })

  belongs_to :case, inverse_of: :sub_cases
end

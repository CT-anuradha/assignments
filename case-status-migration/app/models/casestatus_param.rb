class CasestatusParam
  include Mongoid::Document
  include Mongoid::Timestamps

  field :case_year, type: Integer
  field :case_number, type: Integer
  field :case_type, type: String
  field :main_case, type: String
  field :source, type: String
  field :country, type: String
  field :param, type: Hash
  field :ct_val, type: String

  index({ case_year: 1 }, { unique: false, background: true })
  index({ case_number: 1 }, { unique: false, background: true })
  index({ case_type: 1 }, { unique: false, background: true })
  index({ main_case: 1 }, { unique: false, background: true })
  index({ source: 1}, { unique: false, background: true })

  validates :case_number, :case_type, :main_case, :case_year,:source, presence: true

  belongs_to :case, inverse_of: :casestatus_param
end

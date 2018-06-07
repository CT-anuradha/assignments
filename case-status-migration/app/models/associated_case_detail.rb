class AssociatedCaseDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  extend Enumerize

  field :case_number, type: String
  field :associated_case_type, type: String

  enumerize :associated_case_type, in: [:main_matter, :connected_case]

  index({ case_number: 1 }, { unique: false, background: true })
  index({ associated_case_type: 1 }, { background: true })

  validates :case_number, :associated_case_type, presence: true

  has_many :case_associated_case_details, dependent: :destroy, inverse_of: :associated_case_detail, autosave: true
end

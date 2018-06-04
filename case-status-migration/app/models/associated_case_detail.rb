class AssociatedCaseDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  extend Enumerize

  field :case_number, type: String
  field :associated_case_type, type: String

  enumerize :associated_case_type, in: [:main_matter, :connected_case]

 #enumerize :order_type, in: [:daily, :final, :regular]
  index({ case_number: 1 }, { unique: false, background: true })

  has_many :case_associated_case_details, inverse_of: :associated_case_detail, autosave: true
end

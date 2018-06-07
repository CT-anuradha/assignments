class Party
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :address, type: String

  index({ name: 1 })

  validates :name, uniqueness: { scope: :address }

  has_many :advocate_parties, dependent: :destroy, inverse_of: :party, autosave: true
  has_many :case_parties, dependent: :destroy, inverse_of: :party, autosave: true
end

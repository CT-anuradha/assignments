class Advocate
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  index({ name: 1 }, { unique: false, background: true })

  validates :name, uniqueness: { case_sensitive: false }

  has_many :usr_details, inverse_of: :advocate, autosave: true
  has_many :advocate_parties, inverse_of: :advocate, autosave: true
end

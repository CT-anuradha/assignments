class Advocate
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :code, type: String

  index({ name: 1 }, { unique: false, background: true })
  index({ name: 1, code: 1}, {unique: true, background: true})

  validates :name, uniqueness: { scope: :code, case_sensitive: false }
  has_many :usr_details, inverse_of: :advocate, autosave: true
  has_many :advocate_parties, inverse_of: :advocate, autosave: true
  has_many :case_advocates, inverse_of: :advocate, autosave: true
end

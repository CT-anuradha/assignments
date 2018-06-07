class Act
  include Mongoid::Document
  include Mongoid::Timestamps

  field :act, type: String
  field :section, type: String

  index({ act: 1 }, { unique: false, background: true })
  index({ section: 1 }, { unique: false, background: true })
  index({ act: 1, section: 1}, unique: true)

  validates :act, uniqueness: { case_sensitive: false }, presence: true
  validates :section, uniqueness: true, presence: true

  has_many :case_acts, inverse_of: :act, dependent: :destroy, autosave: true
end

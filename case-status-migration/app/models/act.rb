class Act
  include Mongoid::Document
  include Mongoid::Timestamps

  field :act, type: String
  field :section, type: String

  index({ act: 1 }, { unique: false, background: true })
  index({ section: 1 }, { unique: false, background: true })

  validates :act, uniqueness: { case_sensitive: false }
  validates :section, uniqueness: true

  has_many :case_acts, inverse_of: :act, dependent: :destroy, autosave: true
end

class Judge
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  index({ name: 1 }, { unique: false, background: true })

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :cases, inverse_of: :judges, autosave: true
end

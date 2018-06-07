class CourtGroup
  include Mongoid::Document
  include Mongoid::Timestamps

  field :court_name, type: String
  field :court_type, type: String
  field :bench, type: String

  index({ court_name: 1 })
  index({ bench: 1 })
  index({ court_type: 1, court_name: 1}, { unique: true, background: false })

  validates :court_name, presence: true
  validates :court_type, presence: true

  has_many :cases, inverse_of: :court_group
  belongs_to :location, inverse_of: :court_groups
end

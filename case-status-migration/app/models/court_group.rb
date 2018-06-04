class CourtGroup
  include Mongoid::Document
  include Mongoid::Timestamps

  field :court_name, type: String
  field :court_type, type: String
  field :bench, type: String

  validates :court_name, presence: true
  validates :court_type, presence: true

  has_many :cases, inverse_of: :court_group
  belongs_to :location, inverse_of: :court_groups
end

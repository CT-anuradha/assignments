class Location
  include Mongoid::Document
  include Mongoid::Timestamps

  field :state, type: String
  field :district, type: String

  validates :state, presence: true
  validates :district, presence: true

  has_many :cities, inverse_of: :location, dependent: :destroy, autosave: true
  has_many :court_groups, inverse_of: :location, autosave: true
end

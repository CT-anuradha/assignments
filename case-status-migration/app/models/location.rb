class Location
  include Mongoid::Document
  include Mongoid::Timestamps

  field :state, type: String
  field :district, type: String

  index({ state: 1 })
  index({ district: 1 })
  index({ state: 1, district: 1}, { unique: true, background: false })

  validates :state, presence: true
  validates :district, presence: true

  has_many :cities, inverse_of: :location, dependent: :destroy, autosave: true
  has_many :court_groups, inverse_of: :location, autosave: true
end

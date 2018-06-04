class City
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  index({ name: 1 }, { unique: false, background: true })
  index({ name: 1, location_id: 1 }, { unique: true, background: false })

  validates :name, presence: true, uniqueness: {scope: :location_id, case_sensitive: false}

  belongs_to :location, inverse_of: :cities
end

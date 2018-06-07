class Other
  include Mongoid::Document
  include Mongoid::Timestamps

  field :uri, type: Array

  validates :uri, uniqueness: { case_sensitive: false }

  has_many :cases, inverse_of: :other, autosave: true
end

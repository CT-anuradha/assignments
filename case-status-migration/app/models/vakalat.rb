class Vakalat
  include Mongoid::Document
  include Mongoid::Timestamps

  field :pr_number, type: String
  field :advocate_code, type: String
  field :advocate, type: String

  index({ advocate: 1 }, { unique: false, background: true })

  validates :advocate, uniqueness: { case_sensitive: false }

  belongs_to :case, inverse_of: :vakalats
end

class AdvocateParty
  include Mongoid::Document
  include Mongoid::Timestamps
  extend Enumerize

  field :category, type: String

  enumerize :category, in: [:petitioner, :respondent]

  index({ advocate_id: 1 }, { unique: false, background: true })
  index({ party_id: 1 }, { unique: false, background: true })
  index({ advocate_id: 1, party_id: 1, category: 1}, { unique: true, background: true})

  validates :category, presence: true

  belongs_to :advocate, inverse_of: :advocate_parties
  belongs_to :party, inverse_of: :advocate_parties
end

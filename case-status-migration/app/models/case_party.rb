class CaseParty
  include Mongoid::Document
  include Mongoid::Timestamps

  extend Enumerize

  field :category, type: String

  enumerize :category, in: [:petitioner, :respondent]

  index({ case_id: 1 }, { background: true })
  index({ party_id: 1 }, { background: true })
  index({ category: 1 }, { background: true })
  index({ case_id: 1,  party_id: 1, category: 1}, { unique: true, background: true })

  validates :case_id, :party_id ,:category, presence: true

  belongs_to :party, inverse_of: :case_parties
  belongs_to :case, inverse_of: :case_parties
end

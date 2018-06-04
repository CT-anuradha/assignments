class CaseParty
  include Mongoid::Document
  include Mongoid::Timestamps
  extend Enumerize

  field :category, type: String
  enumerize :category, in: [:petitioner, :respondent]

  index({ case_id: 1 })
  index({ party_id: 1 })

  belongs_to :party, inverse_of: :case_parties, optional: true
  belongs_to :case, inverse_of: :case_parties
end

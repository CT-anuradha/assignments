class CaseAdvocate
  include Mongoid::Document
  include Mongoid::Timestamps

  index({ case_id: 1 }, { unique: false, background: true })
  index({ advocate_id: 1 }, { unique: false, background: true })
  index({ case_id: 1, advocate_id: 1}, { unique: true, background: true } )

  validates :case_id, :advocate_id , presence: true

  belongs_to :case, inverse_of: :case_advocates
  belongs_to :advocate, inverse_of: :case_advocates
end

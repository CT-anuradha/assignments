class FirDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  field :fir_number, type: String
  field :district, type: String
  field :place, type: String

  index({ district: 1 }, { unique: false, background: true })
  index({ place: 1 }, { unique: false, background: true })
  
  has_many :cases, inverse_of: :fir_detail, autosave: true
end

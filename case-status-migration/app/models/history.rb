class History
  include Mongoid::Document
  include Mongoid::Timestamps

  field :judge, type: String
  field :hearing_date, type: Date
  field :purpose, type: String

  index({ judge: 1 }, { unique: false, background: true })
  
  belongs_to :case, inverse_of: :histories
end

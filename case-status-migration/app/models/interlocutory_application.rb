class InterlocutoryApplication
  include Mongoid::Document
  include Mongoid::Timestamps

  field :ia_number, type: String
  field :ia_date, type: Date
  field :status, type: String

  has_many :case_interlocutory_applications, inverse_of: :interlocutory_application, autosave: true
end

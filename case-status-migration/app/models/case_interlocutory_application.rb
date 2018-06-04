class CaseInterlocutoryApplication
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :interlocutory_application, inverse_of: :case_interlocutory_applications
  belongs_to :case, inverse_of: :case_interlocutory_applications
end

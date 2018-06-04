class CaseCourtDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :court_detail, inverse_of: :case_court_details
  belongs_to :case, inverse_of: :case_court_details
end

class CaseAssociatedCaseDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :associated_case_detail, inverse_of: :case_associated_case_details
  belongs_to :case, inverse_of: :case_associated_case_details
end

class CaseSubCase
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :sub_case, inverse_of: :case_sub_cases
  belongs_to :case, inverse_of: :case_sub_cases
end

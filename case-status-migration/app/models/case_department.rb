class CaseDepartment
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :case, inverse_of: :case_departments
  belongs_to :department, inverse_of: :case_departments
end

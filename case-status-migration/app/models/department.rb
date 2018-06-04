class Department
  include Mongoid::Document
  include Mongoid::Timestamps

  field :dept_type, type: String
  field :code, type: String
  field :name, type: String

  has_many :case_departments, inverse_of: :department, autosave: true
end

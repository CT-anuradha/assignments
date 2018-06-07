class Department
  include Mongoid::Document
  include Mongoid::Timestamps

  field :dept_type, type: String
  field :code, type: String
  field :name, type: String

  belongs_to :case, inverse_of: :departments
end

class CategoryDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  field :parent_category, type: String
  field :child_category, type: String

  has_many :case_category_details, inverse_of: :category_detail, autosave: true
end

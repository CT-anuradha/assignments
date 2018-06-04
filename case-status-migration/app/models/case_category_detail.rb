class CaseCategoryDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :case, inverse_of: :case_category_details
  belongs_to :category_detail, inverse_of: :case_category_details
end

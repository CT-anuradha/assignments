class IaDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  field :ia_number, type: String
  field :name, type: String
  field :filed_at, type: Date
  field :next_hearing, type: Date
  field :status, type: String
  field :old_ia_number, type: String
  field :miscellaneous_paper_type, type: String

  belongs_to :case, inverse_of: :ia_detail
end

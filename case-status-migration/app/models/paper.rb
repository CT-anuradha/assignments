class Paper
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number, type: String
  field :paper_type, type: String
  field :filed_at, type: Date

  belongs_to :case, inverse_of: :papers
end

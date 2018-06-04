class CaseHearing
  include Mongoid::Document
  include Mongoid::Timestamps

  field :register_number, type: String
  field :judge, type: String
  field :last_hearing, type: Date
  field :next_hearing, type: Date
  field :status, type: String

  belongs_to :case, inverse_of: :case_hearings
end

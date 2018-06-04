class ExtraParam
  include Mongoid::Document
  include Mongoid::Timestamps

  field :m_fil_no, type: String
  field :m_reg_no, type: String

  validates :m_fil_no, presence: true
  validates :m_reg_no, presence: true

  belongs_to :other, inverse_of: :extra_params, optional: true
end

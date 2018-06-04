class Case
  include Mongoid::Document
  include Mongoid::Timestamps

  extend Enumerize

  field :case_type, type: String
  field :case_number, type: String
  field :year, type: Integer
  field :status, type: String
  field :filing_number, type: String
  field :filed_at, type: Date
  field :register_number, type: String
  field :registered_on, type: Date
  field :cnr, type: String
  field :first_hearing, type: Date
  field :decision_at, type: Date
  field :next_hearing, type: Date
  field :last_hearing, type: Date
  field :presented_on, type: Date
  field :update_at, type: Date
  field :service_at, type: Date
  field :notice_issued_at, type: Date
  field :disposed_on, type: Date
  field :ordered_at, type: Date
  field :judgement_at, type: Date
  field :category, type: String
  field :side, type: String
  field :case_stage, type: String
  field :csp, type: String
  field :flag, type: String

  enumerize :flag, in: [:meta_data, :updated, :crawl, :parse, :not_available_on_website]

  index({ court_group_id: 1 })
  index({ case_act_id: 1 })
  index({ casestatus_param_id: 1 })
  index({ next_hearing: 1 }, { unique: false, background: true })
  index({ case_stage: 1 }, { unique: false, background: true })
  index({ side: 1 }, { unique: false, background: true })
  index({ case_type: 1 }, { unique: false, background: true })
  index({ case_number: 1 }, { unique: false, background: true })
  index({ flag: 1 }, { unique: false, background: true })
  index({ csp: 1 }, { unique: true, background: false })
  index({ case_type: 1, case_number: 1, court_group_id: 1, csp: 1}, { unique: true, background: false })

  validates :case_number, :year, :flag, presence: true
  validates :case_type, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :court_group, inverse_of: :cases, optional: true
  belongs_to :fir_detail, inverse_of: :cases, optional: true
  belongs_to :judge, inverse_of: :cases, optional: true
  belongs_to :other, inverse_of: :cases, optional: true
  has_many :case_sub_cases, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :ia_details, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :case_departments, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :case_details, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :case_category_details, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :histories, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :case_interlocutory_applications, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :case_associated_case_details, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :case_court_details, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :lower_court_details, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :orders, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :papers, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :case_hearings, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :usr_details, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :vakalats, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :case_parties, dependent: :destroy, autosave: true, inverse_of: :case
  has_many :case_acts, dependent: :destroy, autosave: true, inverse_of: :case
  has_one :vehicle, dependent: :destroy, autosave: true, inverse_of: :case
  has_one :case_information, dependent: :destroy, autosave: true, inverse_of: :case
  has_one :filing_detail, dependent: :destroy, autosave: true, inverse_of: :case
  has_one :casestatus_param, dependent: :destroy, autosave: true, inverse_of: :case
end

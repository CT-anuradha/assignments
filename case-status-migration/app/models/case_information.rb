class CaseInformation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :class_code, type: String
  field :date_given_by, type: String
  field :case_bench, type: String
  field :court_number, type: String
  field :sr_number, type: String
  field :stamp_number, type: String
  field :storage_id, type: String
  field :snapshot_url, type: String
  field :nature_of_disposal, type: String
  field :token_number, type: String
  field :disposal_type, type: String
  field :dispose_by_judge, type: String
  field :stamp_or_register, type: String
  field :posted, type: String
  field :last_action, type: String
  field :classification_number, type: String
  field :purpose, type: String
  field :diary_number, type: String
  field :peti_resp_number, type: String
  field :sub_category, type: String
  field :sub_sub_category, type: String

  index({ case_bench: 1 }, { unique: false, background: true })
  index({ storage_id: 1 }, { unique: false, background: true })
  index({ snapshot_url: 1 }, { unique: false, background: true })

  belongs_to :case, inverse_of: :case_information
end

FactoryBot.define do
  factory :associated_case_detail do
    case_number { "CRP 0001185/2017" }
    associated_case_type { "main_matter" }
  end
end

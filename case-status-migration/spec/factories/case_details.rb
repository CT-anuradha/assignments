FactoryBot.define do
  factory :case_detail do
    case_number { "C.A. No. 001663 / 2015" }
    registered_on { FFaker::Time.date }
    filing_no { "SAC  -6847/2017" }
    filed_at { FFaker::Time.date }
  end
end

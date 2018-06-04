FactoryBot.define do
  factory :filing_detail do
    filing_number { "7802/2016" }
    court_fees { FFaker::Random.rand(max = 8) }
    filed_at { FFaker::Time.date }
    case_number { "COP -8/2000" }
  end
end

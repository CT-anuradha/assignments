FactoryBot.define do
  factory :usr_detail do
    usr_number { " 1/2017" }
    advocate { FFaker::Name.name }
    usr_type { "Memo Proof of Service" }
    filing_date { FFaker::Time.date }
  end
end

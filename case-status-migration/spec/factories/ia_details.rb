FactoryBot.define do
  factory :ia_detail do
    ia_number { "1/2018 ()" }
    name { FFaker::Name.name }
    filed_at { FFaker::Time.date }
    next_hearing { FFaker::Time.date }
    status { "Pending" }
    old_ia_number { "CRPMP 4496/2017" }
    miscellaneous_paper_type { "Stay Petition" }
  end
end

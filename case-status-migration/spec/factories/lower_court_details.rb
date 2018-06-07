FactoryBot.define do
  factory :lower_court_detail do
    case_number { "MACT-16/2008" }
    judgeship { "JODHPUR" }
    place { "JODHPUR"}
    court { "M.A.C.T., JUDGE" }
    decision_at { FFaker::Time.date }
  end
end

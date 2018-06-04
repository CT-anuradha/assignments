FactoryBot.define do
  factory :court_detail do
    case_number { "SC 90/2010" }
    court_name { "II ADDL. DISTRICT & SESSIONS JUDGE, (SITTING AT KANAKPURA) KANAKAPURA ,RAMANAGARAM" }
    ordered_at { FFaker::Time.date }
  end
end

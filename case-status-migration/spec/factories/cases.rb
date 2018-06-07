FactoryBot.define do
  factory :case do
    case_type { "Contempt of Court Cases relating to Civil Contempt.(142)" }
    case_number { "Cont.Cas(C)/54/2017" }
    year { "2017" }
    status { "CASE PENDING" }
    filing_number { "1000006/2017" }
    filed_at { FFaker::Time.date }
    register_number { "23/2017" }
    registered_on { FFaker::Time.date }
    cnr { "TRHC01-000948-2017" }
    first_hearing { FFaker::Time.date }
    decision_at { FFaker::Time.date }
    next_hearing { FFaker::Time.date }
    last_hearing { FFaker::Time.date }
    presented_on { FFaker::Time.date }
    update_at { FFaker::Time.date }
    service_at { FFaker::Time.date }
    notice_issued_at { FFaker::Time.date }
    disposed_on { FFaker::Time.date }
    ordered_at { FFaker::Time.date }
    judgement_at { FFaker::Time.date }
    category { "PARTITION" }
    side { "Civil" }
    case_stage { "ARB APPEAL FOR HEARING U/S 37" }
    update_flag { "meta_data" }
  end
end

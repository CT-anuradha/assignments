FactoryBot.define do
  factory :casestatus_param do
    case_year { FFaker::Vehicle.year }
    case_number { FFaker::Random.rand(max = 100) }
    case_type { "ARB. A. (COMM.)" }
    main_case { "C.R.P./62/2015" }
    source { "Delhi high court" }
    country { FFaker::AddressIN.country }
    param { {"This is a hash key" => "This is a hash value"} }
    ct_val { FFaker::Random.rand(100..200) }
  end
end

FactoryBot.define do
  factory :department do
    dept_type { FFaker::AddressCHFR.canton_abbr }
    code { FFaker::AddressCHFR.building_number }
    name { FFaker::Name.name }
  end
end

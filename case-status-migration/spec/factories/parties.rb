FactoryBot.define do
  factory :party do
    name { FFaker::Name.name }
    address { FFaker::AddressAU.full_address }
  end
end

FactoryBot.define do
  factory :order do
    order_number { FFaker::Random.rand(1..10) }
    judge { "HON'BLE MR. JUSTICE S.TALAPATRA" }
    ordered_at { FFaker::Time.date }
    order_details { "View" }
    latest_order { "MyString" }
    link { "This is a link of an order." }
    order_type { "daily" }
  end
end

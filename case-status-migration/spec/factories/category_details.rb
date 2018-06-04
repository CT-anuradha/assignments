FactoryBot.define do
  factory :category_detail do
    parent_category { "FOOF & AGRL.MARKET" }
    child_category { "FISHERIES" }
  end
end

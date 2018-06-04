FactoryBot.define do
  factory :paper do
    number { "25053/2016" }
    paper_type { "PF NOTICE" }
    filed_at { FFaker::Time.date }
  end
end

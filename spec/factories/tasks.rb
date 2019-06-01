FactoryBot.define do
  factory :task do
    name { "MyString" }
    completed_at { "2019-06-01 21:46:34" }
    user { nil }
  end
end

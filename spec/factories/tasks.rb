FactoryBot.define do
  factory :task do
    name { "MyString" }
    completed_at { "2019-06-02 22:35:10" }
    user { nil }
  end
end

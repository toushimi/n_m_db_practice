FactoryBot.define do
  factory :user_event do
    user { nil }
    event { nil }
    attendance { false }
  end
end

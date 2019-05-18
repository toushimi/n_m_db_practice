FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "TEST_Nick#{n}" }
    sequence(:email)    { |n| "TEST_Nick#{n}@test.toushimi.jp" }
    sequence(:password) { |n| "TEST_Nick#{n}_1qaz2wsx" }
    sequence(:password_confirmation) { |n| "TEST_Nick#{n}_1qaz2wsx" }
  end
end

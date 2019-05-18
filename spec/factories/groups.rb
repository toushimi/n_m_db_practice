FactoryBot.define do
  factory :group do
    sequence(:name) { |n| "Group_Test_#{n}" }
    description { "MyText" }
    owner_id { create(:user).id }
  end
end

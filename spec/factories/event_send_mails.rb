FactoryBot.define do
  factory :event_send_mail do
    event { nil }
    send_to { nil }
    subject { "MyString" }
    body { "MyString" }
  end
end

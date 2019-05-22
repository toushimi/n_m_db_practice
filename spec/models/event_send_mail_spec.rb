require 'rails_helper'

RSpec.describe EventSendMail, type: :model do
  before do
    @event = create(:event)
    @event_send_mail = build(:event_send_mail)
  end

  it 'is valid mail with send_to,subject,body'
  it 'is invalid mail with empty send_to'
  it 'is invalid mail with not exist send_to user'
  it 'is invalid mail with empty subject'
  it 'is invalid mail with empty body'
end

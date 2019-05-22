class EventSendMail < ApplicationRecord
  belongs_to :event
  belongs_to :send_to
end

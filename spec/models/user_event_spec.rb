require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  it 'is valid with user_id,event_id,attendance'
  it 'is invalid with not exist user'
  it 'is invalid with empty user'
  it 'is invalid with not exist event'
  it 'is invalid with empty event'
end

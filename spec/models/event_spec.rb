require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'create' do
    before do
      @event = build(:event)
    end
    it 'is valid to create event with name,place,date'
    it 'is invalid to create event with empty name'
    it 'is invalid to create event with empty date'
    it 'is invalid to create event with duplicate name in same group'
    it 'is invalid to create event with duplicate date in same group'
  end

  describe 'join_leave_unanswered' do
    before do
      @event = build(:event)
    end
    it 'is valid to user joins to answer'
    it 'is invalid to member join answer'
    it 'is valid to user leaves to answer'
    it 'is invalid to leaved user leave answer'
  end
end

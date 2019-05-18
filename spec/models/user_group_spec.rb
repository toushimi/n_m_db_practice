require 'rails_helper'

RSpec.describe UserGroup, type: :model do
  before do
    @group= create(:group)
    @user = create(:user)
  end
  it 'is valid with user,group' do
    usergroup = UserGroup.new({user: @user, group: @group})
    expect(usergroup.valid?).to be_truthy
  end

  it 'is invalid with not exist user' do
    usergroup = UserGroup.new({user_id: @user.id+1, group: @group})
    expect(usergroup.valid?).to be_falsey
  end

  it 'is invalid with not exist group' do
    usergroup = UserGroup.new({user: @user, group_id: @group.id+1})
    expect(usergroup.valid?).to be_falsey
  end
end

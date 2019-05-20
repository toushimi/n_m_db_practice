require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = build(:group)
    @owner = @group.owner
    @member= build(:user)
  end
  it 'is valid with name,description,owner' do
    expect(@group.valid?).to be_truthy
  end

  it 'is valid without description' do
    @group.description = ''
    expect(@group.valid?).to be_truthy
  end

  it 'is invalid with duplicate name' do
    name = @group.name
    @group.save
    group = build(:group)
    group.name = name
    expect(group.valid?).to be_falsey
  end
  it 'can reference owner user' do
    expect(@group.owner).to eq(User.find(@group.owner.id))
  end
  it 'is valid with duplicate owner records' do
    @group.save
    group = build(:group)
    group.owner = @owner
    expect(group.valid?).to be_truthy
  end

  it 'is invalid with not exists owner' do
    @group.owner_id += 1
    expect(@group.valid?).to be_falsey
  end

  it 'can invite user' do
    @group.save
    usergroup = @group.invite(@member)
    expect(usergroup.id).not_to be_nil
    expect(usergroup.user_id).to eq(@member.id)
    expect(usergroup.group_id).to eq(@group.id)
  end

  it 'cannot invite user' do
    @group.save
    expect(@group.invite(@group.owner)).to be_falsey
    expect(@group.users).to be_empty
  end

  it 'can kick user' do
    @group.save
    @group.invite(@member)
    expect(@group.kick(@member).destroyed?).to be_truthy
    expect(@group.users).not_to include(@member)
  end

  it 'can list group members' do
    @group.save
    @group.invite(@member)
    expect(@group.users).to match_array([@member])
  end

  it 'cannot invite member' do
    @group.save
    @group.invite(@member)
    expect(@group.invite(@member)).to be_falsey
    expect(@group.users).to match_array([@member])
  end

  it 'cannot kick not a member' do
    @group.save
    expect(@group.kick(@member)).to be_falsey
    expect(@group.users).to be_empty
  end
end

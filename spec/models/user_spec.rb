require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end
  it 'is valid with nickname,email,password' do
    expect(@user.valid?).to be_truthy
  end

  it 'is invalid with blank nickname' do
    @user.nickname = ''
    expect(@user.valid?).to be_falsey
  end

  it 'is invalid with blank email' do
    @user.email = ''
    expect(@user.valid?).to be_falsey
  end

  it 'is invalid with email excluded @' do
    @user.email.sub!('@','')
    expect(@user.valid?).to be_falsey
  end

  it 'is invalid with duplicate nickname' do
    nickname = @user.nickname
    @user.save
    user = build(:user)
    user.nickname = nickname
    expect(user.valid?).to be_falsey
  end

  it 'is invalid with duplicate email' do
    email = @user.email
    @user.save
    user = build(:user)
    user.email = email
    expect(user.valid?).to be_falsey
  end

  it 'is invalid password length less than 6 characters' do
    @user.password = 'test0'
    @user.password_confirmation = 'test0'
    expect(@user.valid?).to be_falsey
  end

  it 'is invalid with unmatch password and password_confirmation' do
    @user.password_confirmation = "abcdefgh1"
    expect(@user.valid?).to be_falsey
  end

  it 'can authenticate with created user' do
    password = @user.password
    @user.save
    user = User.find(@user.id)
    expect(user.authenticate(password)).to be_truthy
  end

  it 'is invalid nickname with denied character' do
    # permit character is [a-zA-Z_][a-zA-Z0-9_]
    @user.nickname = 'Test_01@a'
    expect(@user.valid?).to be_falsey
  end

  it 'is invalid nickname with too long string' do
    # permit length in: 3..20
    @user.nickname = ['abcde','fghij', 'klmno', 'pqrst','u'].join("")
    expect(@user.valid?).to be_falsey
  end

  it 'is invalid nickname with too short string' do
    @user.nickname = 'ab'
    expect(@user.valid?).to be_falsey
  end

  it 'is invalid nickname with start number' do
    @user.nickname = '2test'
    expect(@user.valid?).to be_falsey
  end

  it 'is valid nickname with number' do
    @user.nickname = 'test2'
    expect(@user.valid?).to be_truthy
  end

  it 'is valid nickname with underline' do
    @user.nickname = 'test_2'
    expect(@user.valid?).to be_truthy
  end

  it 'can list owner users' do
    @user.save
    group1 = build(:group)
    group1.owner = @user
    group1.save
    group2 = build(:group)
    group2.owner = @user
    group2.save
    expect(@user.owner_groups).to match_array([group1,group2])
  end

  it 'can list member of groups' do
    @user.save
    group1 = create(:group)
    group2 = create(:group)
    @user.join(group1)
    @user.join(group2)
    expect(@user.groups).to match_array([group1,group2])
  end

  it 'can read confirm_token after create' do
    @user.save
    expect(@user.confirm_token).to be_a(String)
  end

  it 'is valid to email activate' do
    @user.save
    @user.email_activate
    expect(@user.email_confirmed).to be_truthy
    expect(@user.confirm_token).to be_nil
  end
end

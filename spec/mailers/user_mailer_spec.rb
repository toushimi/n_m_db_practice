require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'Registration Confirmation' do
    before do
      @user = create(:user)
      @mail = UserMailer.registration_confirmation(@user)
    end

    it 'is valid mail with from,to,subject,body' do
      expect(@mail.from.first).to eq UserMailer.default[:from]
      expect(@mail.to.first).to eq @user.email
      expect(@mail.subject).to eq 'メールアドレス登録の確認'
      expect(@mail.body).to include(confirm_email_user_url @user.confirm_token)
    end
  end
end

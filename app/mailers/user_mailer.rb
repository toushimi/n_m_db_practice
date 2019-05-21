class UserMailer < ApplicationMailer
  default from: 'contact@toushimi.jp'
  def registration_confirmation(user)
    @user = user
    mail(
      to: "#{user.nickname} <#{user.email}>",
      subject: 'メールアドレス登録の確認'
    )
  end
end

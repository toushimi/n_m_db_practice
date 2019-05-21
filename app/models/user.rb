class User < ApplicationRecord
  has_secure_password

  has_many :owner_groups, class_name: 'Group', foreign_key: :owner_id
  has_many :user_groups
  has_many :groups, through: :user_groups

  VALIDATE_EMAIL_REGEX = /.+@.+/

  validates :nickname, presence: true
  validates :nickname, uniqueness: true
  validates :nickname, length: { minimum: 3 }
  validates :nickname, length: { maximum: 20 }
  validates :nickname, format: /\A[a-zA-Z_][a-zA-Z0-9_]+\Z/
  validates :email, uniqueness: true
  validates :email, format: VALIDATE_EMAIL_REGEX
  validates :password, length: { minimum: 6 }
  before_create :confirmation_token

  def self.find_by_nickname_or_email(param)
    if param[:username].include?('@')
      find_by_email(param[:username])
    else
      find_by_nickname(param[:username])
    end
  end

  def join(group)
    usergroup = UserGroup.new({user: self, group: group})
    if usergroup.valid?
      usergroup.save
      usergroup
    else
      false
    end
  end

  def leave(group)
    usergroup = UserGroup.find_by({ user_id: self.id, group_id: group.id })
    if usergroup
      usergroup.destroy
    else
      false
    end
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)

  end

  private

  def confirmation_token
    if confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end

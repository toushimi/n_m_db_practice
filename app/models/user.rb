class User < ApplicationRecord
  has_secure_password

  VALIDATE_EMAIL_REGEX = /.+@.+/

  validates :nickname, presence: true
  validates :nickname, uniqueness: true
  validates :nickname, length: { minimum: 3 }
  validates :nickname, length: { maximum: 20 }
  validates :nickname, format: /\A[a-zA-Z_][a-zA-Z0-9_]+\Z/
  validates :email, uniqueness: true
  validates :email, format: VALIDATE_EMAIL_REGEX
  validates :password, length: { minimum: 6 }

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
end

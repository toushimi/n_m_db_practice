class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :user_groups
  has_many :users, through: :user_groups

  validates :name, uniqueness: true

  def invite(user)
    user.join(self)
  end

  def kick(user)
    user.leave(self)
  end
end


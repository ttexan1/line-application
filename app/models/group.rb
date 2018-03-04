class Group < ApplicationRecord
  has_many :users_groups, inverse_of: :group
  has_many :users, through: :users_groups
  has_many :messages
  accepts_nested_attributes_for :users_groups, allow_destroy: true,reject_if: :all_blank

  validates :status, presence: true
  validates :name, presence: true

  mount_uploader :thumbnail, ImageUploader

  enum status: { pair: 0, more: 1 }


  def another_user(current_user)
    another = self.users_groups.where.not(user_id: current_user.id)
    return another.first.user
  end

  def room(current_user)
    if self.status == 'pair'
      user = self.another_user(current_user)
    else
      user = self
    end
  end

  def other_member(current_user)
    if self.status == 'more'
      others = self.users.where.not(id: current_user.id)
    else
      others = nil
    end
  end

end

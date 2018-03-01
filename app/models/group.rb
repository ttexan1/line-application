class Group < ApplicationRecord
  has_many :users_groups, inverse_of: :group
  has_many :users, through: :users_groups
  has_many :messages
  accepts_nested_attributes_for :users_groups, allow_destroy: true,reject_if: :all_blank

  enum status: { pair: 0, more: 1 }

  def another_user(current_user)
    another = self.users_groups.where.not(user_id: current_user.id)
    return another.first.user
  end

end

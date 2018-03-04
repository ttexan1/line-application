class Relationship < ApplicationRecord
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"
  validates :from_user_id, presence: true
  validates :to_user_id, presence: true

  def self.find_by_from_or_to(user_a,user_b)
    self.find_by(from_user_id: user_a.id, to_user_id: user_b.id) ||
    self.find_by(from_user_id: user_b.id, to_user_id: user_a.id)
  end

  def create_group
    group = Group.create(status: :pair, name: "pair")
    group_id = group.id
    UsersGroup.create(group_id: group_id, user_id: self.from_user_id)
    UsersGroup.create(group_id: group_id, user_id: self.to_user_id)
  end
end

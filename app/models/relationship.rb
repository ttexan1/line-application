class Relationship < ApplicationRecord
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"
  validates :from_user_id, presence: true
  validates :to_user_id, presence: true

  enum status: { pair: 0, more: 1 }

  def self.all_relationships(a)
    self.where(from_user_id: a.id).or(Relationship.where(to_user_id: a.id)).includes(:talk_room)
  end

  def self.find_by_from_or_to(user_a,user_b)
    self.find_by(from_user_id: user_a.id, to_user_id: user_b.id) ||
    self.find_by(from_user_id: user_b.id, to_user_id: user_a.id)
  end

end

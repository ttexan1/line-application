class Relationship < ApplicationRecord
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"
  has_one :talk_room, inverse_of: :relationship
  validates :from_user_id, presence: true
  validates :to_user_id, presence: true

  def self.all_relationships(a)
    self.where(from_user_id: a.id).or(Relationship.where(to_user_id: a.id)).includes(:talk_room)
  end

  def self.find_by_from_or_to(a,b)
    self.find_by(from_user_id: a.id, to_user_id: b.id) ||
    self.find_by(from_user_id: b.id, to_user_id: a.id)
  end
end

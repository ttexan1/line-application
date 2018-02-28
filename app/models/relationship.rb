class Relationship < ApplicationRecord
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"
  has_one :talk_room, inverse_of: :relationship
  validates :from_user_id, presence: true
  validates :to_user_id, presence: true
end

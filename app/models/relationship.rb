class Relationship < ApplicationRecord
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"
  validates :from_user_id, presence: true
  validates :to_user_id, presence: true

  # def self.find_or_init_by(from_user_id, to_user_id)
  #   relationships.find{|r| r.company_id == company_id} ||
  #   Relationship.new(to_user_id: to_user, status: :normal)
  # end

end

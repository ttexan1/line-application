class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :users_groups
  has_many :groups, through: :users_groups
  has_many :messages

  has_many :from_user_relationships, foreign_key: "to_user_id", class_name: "Relationship", dependent: :destroy
  has_many :from_users, through: :from_user_relationships
  has_many :to_user_relationships, foreign_key: "from_user_id", class_name: "Relationship", dependent: :destroy
  has_many :to_users, through: :to_user_relationships

  def friends
     from_users + to_users
  end
  
  # def following?(other_user)
  #   following_relationships.find_by(following_id: other_user.id)
  # end
  #
  # def follow!(other_user)
  #   following_relationships.create!(following_id: other_user.id)
  # end
  #
  # def unfollow!(other_user)
  #   following_relationships.find_by(following_id: other_user.id).destroy
  # end


end

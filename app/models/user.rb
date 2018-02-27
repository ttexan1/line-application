class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :users_groups
  has_many :groups, through: :users_groups
  has_many :messages

  # has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  # has_many :followings, through: :following_relationships
  #
  # has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  # has_many :followers, through: :follower_relationships
end

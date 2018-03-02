class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :users_groups, inverse_of: :user
  has_many :groups, through: :users_groups
  has_many :messages

  has_many :from_user_relationships, foreign_key: "to_user_id", class_name: "Relationship", dependent: :destroy
  has_many :from_users, through: :from_user_relationships
  has_many :to_user_relationships, foreign_key: "from_user_id", class_name: "Relationship", dependent: :destroy
  has_many :to_users, through: :to_user_relationships

  validates :name, presence: true

  def friends
     from_users + to_users
  end

end

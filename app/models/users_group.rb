class UsersGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group, inverse_of: :users_groups
  validates :user_id, presence: true
  # validates :group_id, presence: true
  # バリデーションをかけるとクリエイトができなくなる
end

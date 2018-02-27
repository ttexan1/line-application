class Group < ApplicationRecord
  has_many :users_groups
  has_many :users, through: :users_groups
  has_one :talk_room
  # accepts_nested_attributes_for :group_users
  # 他のモデルを一括で更新、保存できるようにする
  # groupを保存するのと同時にgroup_usersを更新できる
end

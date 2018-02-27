class Group < ApplicationRecord
  has_many :users_groups, inverse_of: :group
  has_many :users, through: :users_groups
  has_one :talk_room, inverse_of: :group
  accepts_nested_attributes_for :users_groups, allow_destroy: true,reject_if: :all_blank
  accepts_nested_attributes_for :talk_room, allow_destroy: true,reject_if: :all_blank

end

class UsersGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group, inverse_of: :users_groups
end

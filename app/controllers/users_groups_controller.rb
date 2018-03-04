class UsersGroupsController < ApplicationController
  validates :group_id, uniqueness: {scope: :user_id}
end

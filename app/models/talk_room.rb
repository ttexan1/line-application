class TalkRoom < ApplicationRecord
  belongs_to :group, inverse_of: :talk_room
  has_many :messages
end

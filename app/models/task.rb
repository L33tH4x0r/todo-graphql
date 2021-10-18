class Task < ApplicationRecord
  belongs_to :list

  scope :user_owned, ->(user) { where(list: user.lists) }
end

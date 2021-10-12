class List < ApplicationRecord
  has_many :tasks
  belongs_to :user, required: true

  validate :title, presence: true, length: { in: 2..250 }
end

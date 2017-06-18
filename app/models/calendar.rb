class Calendar < ApplicationRecord
  validates :name, presence: true
  has_many :events

  # uncomment after create User
  # validates :user_id, presence: true
end

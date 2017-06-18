class Calendar < ApplicationRecord
  validates :name, presence: true

  # uncomment after create User
  # validates :user_id, presence: true
end

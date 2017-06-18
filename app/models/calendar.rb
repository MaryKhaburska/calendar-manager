class Calendar < ApplicationRecord
  validates :name, presence: true
  has_many :events

  mount_uploader :ical_link, IcalLinkUploader

  # uncomment after create User
  # validates :user_id, presence: true
end

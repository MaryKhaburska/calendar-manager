class Calendar < ApplicationRecord
  validates :name, presence: true
  has_many :events
  # after_save :create_events
  # after_save :actualize_count

  mount_uploader :ical_link, IcalLinkUploader

  # uncomment after create User
  # validates :user_id, presence: true

  private

    # def create_events
    #   file = self.ical_link
    #   parsed_events = parse_ics(file)
    #   parsed_events.map do |e|
    #     self.events.create(e) unless Event.where(uuid: e[:uuid]).present?
    #   end
    # end

    def actualize_count
      self.count = self.events.size
    end
end

FactoryGirl.define do
  factory :calendar do
    name "calendar_01"
    trackable false
    count 0
    ical_link File.open("public/uploads/test_cal.ics")
  end
end

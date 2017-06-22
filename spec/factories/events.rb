FactoryGirl.define do
  factory :event do
    uuid 1
    name "MyString"
    description "MyText"
    duration "2017-06-18 13:06:11"
    location "MyString"
    start_date "2017-06-18 13:06:11"
    end_date "2017-06-18 13:06:11"
    wholeday false
    repeat []
    association :calendar, id: 1
  end
end

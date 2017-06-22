require 'rails_helper'

RSpec.describe Calendar, type: :model do
  before { @calendar = FactoryGirl.build(:calendar) }

  subject { @calendar }

  it { should respond_to(:name) }
  it { should respond_to(:trackable) }
  it { should respond_to(:count) }
  it { should respond_to(:ical_link) }
  it { should respond_to(:user_id) }
  # uncomment after create User
  # it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:name) }
  it { should be_valid }

  it { should have_many(:events) }
end

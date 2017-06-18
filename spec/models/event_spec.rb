require 'rails_helper'

RSpec.describe Event, type: :model do
  before { @event = FactoryGirl.build(:event) }

  subject { @event }

  it { should respond_to(:uuid) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:duration) }
  it { should respond_to(:location) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:wholeday) }
  it { should respond_to(:repeat) }
  it { should respond_to(:calendar_id) }

  it { should validate_presence_of(:name) }
  it { should be_valid }

  it { should belong_to(:calendar) }
end

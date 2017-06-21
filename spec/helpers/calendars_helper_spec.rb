require 'rails_helper'

RSpec.describe CalendarsHelper, type: :helper do
  before(:each) do
    @event = Icalendar::Event.new
  end

  describe "#parse_ics" do
    it "return Icalendar::Event events" do
      ics_file = File.open("public/uploads/test_cal.ics")
      expect(
        helper.parse_ics(ics_file).first
      ).to be_an_instance_of(Icalendar::Event)
    end

    it "parse instance_of(IcalLinkUploader)" do
      calendar = FactoryGirl.create(:calendar)
      expect(
        helper.parse_ics(calendar.ical_link).first
      ).to be_an_instance_of(Icalendar::Event)
    end
  end

  describe "#calc_duration" do
    it "calculate event duration smaller than 1 day" do
      @event.dtstart = Time.now
      @event.dtend = @event.dtstart + 2.hours
      expect(helper.calc_duration(@event)).to eq(7200)
    end

    it "calculate event duration bigger than 1 day" do
      @event.dtstart = DateTime.now
      @event.dtend = @event.dtstart + 1.day + 2.hours
      expect(helper.calc_duration(@event)).to eq(93600)
    end
  end

  describe "#determine_wholeday" do
    it "should determine wholeday event" do
      @event.dtstart = Icalendar::Values::Date.new Date.today
      @event.dtend = @event.dtstart + 1.day
      expect(helper.determine_wholeday(@event)).to be(true)
    end
  end

  describe "#parse_event_params" do
    before { @ics_file = File.open("public/uploads/test_cal.ics") }
    it { expect(parse_event_params(@ics_file)).to be_an_instance_of(Array) }
    it { expect(parse_event_params(@ics_file).size).to eql(8) }
  end
end

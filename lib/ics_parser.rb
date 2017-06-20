module IcsParser
  require 'icalendar'

  def parse_ics(file)
    cal_file = File.open(file)
    cals = Icalendar::Calendar.parse(cal_file)
    cal.events
  end
end

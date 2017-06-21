module CalendarsHelper
  include Icalendar

  # Argument is path to ics file
  # returns events in Icalendar format
  # => uuid = e.uid
  # => name = e.summary
  # => description = e.description
  # => location = e.location
  # => duration = e.dtstart - e.dtend
  # => start_date = e.dtstart
  # => end_date = e.dtend
  # => wholeday = e.duration == 1 day
  # => repeat = if e.rrule.present?
  def parse_ics(file)
    if file.instance_of?(IcalLinkUploader)
      cal_file = File.open(file.file.file)
    else
      cal_file = File.open(file)
    end
      events = Icalendar::Event.parse(cal_file)
  end

  # returns duration in seconds
  def calc_duration(event)
    if event.dtstart.instance_of?(Icalendar::Values::DateTime)
      event.dtend.to_i - event.dtstart.to_i
    elsif event.dtstart.instance_of?(Icalendar::Values::Date)
      de = DateTime.parse(event.dtend.to_s).to_i
      ds = DateTime.parse(event.dtstart.to_s).to_i
      de - ds
    else
      raise ArgumentError.new("Date #{event.dtstart} is wrong.")
    end
  end

  def determine_wholeday(event)
    event.dtstart.instance_of?(Icalendar::Values::Date) &&
    calc_duration(event) == 1.day
  end

  def get_event_params(e)
    {
      uuid:         e.uid,
      name:         e.summary,
      description:  e.description,
      location:     e.location,
      start_date:   e.dtstart,
      end_date:     e.dtend,
      duration:     calc_duration(e),
      wholeday:     determine_wholeday(e),
      repeat:       e.rrule
    }
  end
end

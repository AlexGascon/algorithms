# Time Conversion
# Given a time in 12-hour AM/PM format, convert it to military (24-hour) time.
# Note:
#   - 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock.
#   - 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock. 
# https://www.hackerrank.com/challenges/one-week-preparation-kit-time-conversion/problem

class TimeConverter
  def self.converted_time_for(time_string)
    time_without_suffix = time_string.delete_suffix('AM').delete_suffix('PM')
    hour, minutes, seconds = time_without_suffix.split(':')

    if am_time?(time_string)
      converted_hour = converted_am_hour(hour)
    else 
      converted_hour = converted_pm_hour(hour)
    end

    "#{converted_hour}:#{minutes}:#{seconds}"
  end

  private

  def self.am_time?(time_string)
    time_string.end_with?('AM')
  end

  def self.converted_am_hour(hour)
    return '00' if hour == '12'

    hour
  end

  def self.converted_pm_hour(hour)
    return '12' if hour == '12'

    (hour.to_i + 12).to_s
  end
end
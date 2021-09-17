# frozen_string_literal: true

module UsersHelper
  def calculate_total_times(user, log_type)
    entries = Entry.entries_through_time(user.id, log_type_to_day(log_type))
    entries.inject(0) { |total, entry| total + calculate_total_time(entry) }
  end

  def log_type_to_day(log_type)
    result = 30.days.ago
    result = 1.days.ago if log_type == 'Daily'
    result = 7.days.ago if log_type == 'Weekly'
    result
  end
end

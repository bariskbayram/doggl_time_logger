# frozen_string_literal: true

module EntriesHelper
  def get_user_email(entry)
    User.find_by_id(entry.user_id).email
  end

  def get_type_desc(entry)
    Type.find_by_id(entry.type_id).description
  end

  def calculate_total_time(entry)
    ((entry.stop_time - entry.start_time) / 3600).round(2)
  end
end

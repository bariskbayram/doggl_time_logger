# frozen_string_literal: true

# == Schema Information
#
# Table name: entries
#
#  id          :bigint           not null, primary key
#  description :string
#  start_time  :datetime
#  stop_time   :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  type_id     :integer
#
class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :type

  scope :entries_through_time, ->(user_id, day) { where('user_id = ? AND start_time > ?', user_id, day) }
  after_create_commit { broadcast_append_to 'entries' }
end

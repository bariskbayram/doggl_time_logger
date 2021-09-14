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
require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

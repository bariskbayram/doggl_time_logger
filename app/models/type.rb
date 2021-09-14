# frozen_string_literal: true

# == Schema Information
#
# Table name: types
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Type < ApplicationRecord
  has_many :entries
end

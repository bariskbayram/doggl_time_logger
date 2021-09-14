# frozen_string_literal: true

class TempWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(message)
    sleep 5
    puts "SIDEKIQ WORKER => #{message}"
  end
end

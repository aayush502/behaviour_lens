# frozen_string_literal: true

module BehaviorLens
  class SessionTracker
    def initialize
      @sessions = {}
    end

    def start(user_id)
      @sessions[user_id] = { start_time: Time.now, end_time: nil }
    end

    def end(user_id)
      return unless @sessions[user_id] && @sessions[user_id][:start_time]

      @sessions[user_id][:end_time] = Time.now
    end

    def report
      @sessions
    end
  end
end

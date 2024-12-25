# frozen_string_literal: true

module BehaviorLens
  class SessionTracker
    def initialize
      Database.connect
    end

    def start(user_id)
      Session.create(
        user_id: user_id,
        start_time: Time.now
      )
    end

    def end(user_id)
      session = Session.find_by(user_id: user_id, end_time: nil)
      return unless session

      session.update(end_time: Time.now)
    end

    def report
      Session.all.map do |session|
        {
          user_id: session.user_id,
          start_time: session.start_time,
          end_time: session.end_time
        }
      end
    end
  end
end

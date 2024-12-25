# frozen_string_literal: true

module BehaviorLens
  class EventTracker
    def track(event_name, metadata = {})
      Event.create(
        name: event_name,
        timestamp: Time.now,
        metadata: metadata
      )
    end

    def report
      Event.all.map do |event|
        {
          name: event.name,
          timestamp: event.timestamp,
          metadata: event.metadata
        }
      end
    end
  end
end

# frozen_string_literal: true

require_relative '../behavior_lens/models/event'

module BehaviorLens
  class EventTracker
    def initialize
      Database.connect
    end

    def track(event_name, metadata = {})
      Event.create(
        name: event_name,
        metadata: metadata
      )
    end

    def report
      Event.all.map do |event|
        {
          name: event.name,
          timestamp: event.created_at,
          metadata: event.metadata
        }
      end
    end
  end
end

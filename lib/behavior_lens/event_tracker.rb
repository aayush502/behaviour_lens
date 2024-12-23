# frozen_string_literal: true

module BehaviorLens
  class EventTracker
    def initialize
      @events = []
    end

    def track(event_name, metadata = {})
      @events << { name: event_name, timestamp: Time.now, metadata: metadata }
    end

    def report
      @events
    end
  end
end

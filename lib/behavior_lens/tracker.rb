# # frozen_string_literal: true

# module BehaviorLens
#   class Tracker
#     def initialize
#       @click_tracker = ClickTracker.new
#       @session_tracker = SessionTracker.new
#       @event_tracker = EventTracker.new
#     end

#     # Delegates most_clicked to ClickTracker
#     def most_clicked
#       @click_tracker.most_clicked
#     end

#     def track_click(link)
#       @click_tracker.track(link)
#     end

#     def start_session(user_id)
#       @session_tracker.start(user_id)
#     end

#     def end_session(user_id)
#       @session_tracker.end(user_id)
#     end

#     def track_event(event_name, metadata = {})
#       @event_tracker.track(event_name, metadata)
#     end

#     def generate_report(format: :json)
#       ReportGenerator.generate(@click_tracker, @session_tracker, @event_tracker, format)
#     end
#   end
# end
require_relative 'database'
module BehaviorLens
  class Tracker
    def initialize
      Database.connect
      Database.setup
      @click_tracker = ClickTracker.new
      @session_tracker = SessionTracker.new
      @event_tracker = EventTracker.new
    end

    def track_click(link)
      @click_tracker.track(link)
    end

    def start_session(user_id)
      @session_tracker.start(user_id)
    end

    def end_session(user_id)
      @session_tracker.end(user_id)
    end

    def track_event(name, metadata = {})
      @event_tracker.track(name, metadata)
    end

    def generate_report(format: :json)
      ReportGenerator.generate(@click_tracker, @session_tracker, @event_tracker, format)
    end
  end
end

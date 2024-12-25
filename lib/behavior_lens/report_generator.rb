# frozen_string_literal: true

require 'json'
require 'csv'

module BehaviorLens
  class ReportGenerator
    def self.generate(click_tracker, session_tracker, event_tracker, format)
      # Fetch data from the trackers
      clicks = click_tracker.report
      sessions = session_tracker.report
      events = event_tracker.report

      data = {
        clicks: clicks.map { |click| { link: click[:link], count: click[:count] } },
        sessions: sessions.map { |session| { user_id: session[:user_id], start_time: session[:start_time], end_time: session[:end_time] } },
        events: events.map { |event| { name: event[:name], metadata: event[:metadata], timestamp: event[:timestamp] } }
      }

      case format
      when :json
        JSON.pretty_generate(data)
      when :csv
        generate_csv(data)
      else
        data.to_s
      end
    end

    private

    def self.generate_csv(data)
      CSV.generate do |csv|
        csv << %w[Category Item Details]

        # Add click data
        data[:clicks].each do |click|
          csv << ['Click', click[:link], "Count: #{click[:count]}"]
        end

        # Add session data
        data[:sessions].each do |session|
          csv << ['Session', session[:user_id], "Start: #{session[:start_time]}, End: #{session[:end_time]}"]
        end

        # Add event data
        data[:events].each do |event|
          csv << ['Event', event[:name], event[:metadata].to_json]
        end
      end
    end
  end
end

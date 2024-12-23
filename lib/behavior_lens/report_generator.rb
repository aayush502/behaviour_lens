# frozen_string_literal: true

require 'json'
require 'csv'

module BehaviorLens
  class ReportGenerator
    def self.generate(click_tracker, session_tracker, event_tracker, format)
      data = {
        clicks: click_tracker.report,
        sessions: session_tracker.report,
        events: event_tracker.report
      }

      case format
      when :json
        JSON.pretty_generate(data)
      when :csv
        CSV.generate do |csv|
          csv << %w[Category Item Value]

          # Format clicks
          data[:clicks].each do |url, count|
            csv << ['Click', url, count]
          end

          # Format sessions
          data[:sessions].each do |user_id, session|
            csv << ['Session', user_id, "Start: #{session[:start_time]}, End: #{session[:end_time]}"]
          end

          # Format events
          data[:events].each do |event|
            csv << ['Event', event[:name], event[:metadata].to_json]
          end
        end
      else
        data.to_s
      end
    end
  end
end

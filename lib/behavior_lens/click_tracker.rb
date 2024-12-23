# frozen_string_literal: true

module BehaviorLens
  class ClickTracker
    def initialize
      @clicks = Hash.new(0)
    end

    def track(link)
      @clicks[link] += 1
    end

    def most_clicked
      @clicks.max_by { |_, count| count }
    end

    def report
      @clicks
    end
  end
end

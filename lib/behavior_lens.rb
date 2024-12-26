# frozen_string_literal: true

require_relative 'behavior_lens/tracker'
require_relative 'behavior_lens/version'
require_relative 'behavior_lens/click_tracker'
require_relative 'behavior_lens/session_tracker'
require_relative 'behavior_lens/event_tracker'
require_relative 'behavior_lens/report_generator'

module BehaviorLens
  class Error < StandardError; end
end

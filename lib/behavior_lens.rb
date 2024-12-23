# frozen_string_literal: true

require_relative 'behavior_lens/tracker'
require_relative 'behavior_lens/version'
require_relative 'behavior_lens/click_tracker'
require_relative 'behavior_lens/session_tracker'
require_relative 'behavior_lens/event_tracker'
require_relative 'behavior_lens/report_generator'
# require_relative 'behavior_lens/utils/config'
# require_relative 'behavior_lens/utils/logger'

module BehaviorLens
  class Error < StandardError; end
end

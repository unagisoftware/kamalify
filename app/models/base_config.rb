# frozen_string_literal: true

require "yaml"
require "active_support/core_ext/hash/deep_merge"
require "active_support/core_ext/object/blank"

class BaseConfig
  def initialize(params = {})
    @params = params || {}
  end

  def to_h
    defaults.deep_merge(@params)
  end

  private

  def defaults
    {}
  end
end

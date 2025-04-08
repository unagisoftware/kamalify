# frozen_string_literal: true

class BaseConfig
  def initialize(params = {})
    @params = params || {}
  end

  def to_h
    defaults.deep_merge(values.compact)
  end

  private

  def values
    raise NotImplementedError.new("This method must be implemented in a subclass")
  end
end

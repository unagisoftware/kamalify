# frozen_string_literal: true

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

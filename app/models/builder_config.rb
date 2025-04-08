# frozen_string_literal: true

class BuilderConfig < BaseConfig
  private

  def values
    {}
  end

  def defaults
    { arch: "amd64" }
  end
end

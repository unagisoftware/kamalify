# frozen_string_literal: true

class BuilderConfig < BaseConfig
  private

  def defaults
    { arch: "amd64" }
  end
end

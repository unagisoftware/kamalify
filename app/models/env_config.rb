# frozen_string_literal: true

class EnvConfig < BaseConfig
  private

  def values
    {}
  end

  def defaults
    { secrets: [ "RAILS_MASTER_KEY" ] }
  end
end

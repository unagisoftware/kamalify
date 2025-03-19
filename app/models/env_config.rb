# frozen_string_literal: true

class EnvConfig < BaseConfig
  private

  def defaults
    { secret: [ "RAILS_MASTER_KEY" ] }
  end
end

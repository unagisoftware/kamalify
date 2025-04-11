# frozen_string_literal: true

class RegistryConfig < BaseConfig
  private

  def values
    {}
  end

  def defaults
    { username: "registry-user-name", password: [ "KAMAL_REGISTRY_PASSWORD" ] }
  end
end

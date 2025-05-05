# frozen_string_literal: true

class RegistryConfig < BaseConfig
  private

  def values
    {
      server:,
      username:,
      password:
    }
  end

  def server
    @params[:server].presence
  end

  def username
    @params[:username].presence
  end

  def password
    return unless @params[:password].present?

    [ @params[:password].presence ]
  end

  def defaults
    { username: "registry-user-name", password: [ "KAMAL_REGISTRY_PASSWORD" ] }
  end
end

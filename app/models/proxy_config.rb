# frozen_string_literal: true

class ProxyConfig < BaseConfig
  private

  def values
    {
      hosts:,
      ssl:,
      app_port:
    }
  end

  def hosts
    hosts = @params[:hosts].presence

    return if hosts.blank?

    hosts = hosts.reject(&:blank?)

    hosts.size == 1 ? hosts.first : hosts
  end

  def ssl
    @params.dig(:ssl, :enabled)&.to_boolean
  end

  def app_port
    return unless @params[:app_port].present?

    @params[:app_port].to_i
  end

  def defaults
    { hosts: "myapp.example.com" }
  end
end

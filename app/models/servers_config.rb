# frozen_string_literal: true

class ServersConfig < BaseConfig
  private

  def values
    {
      web:,
      jobs:
    }
  end

  def defaults
    { web: "100.100.100.100" }
  end

  def web
    @params[:host].presence
  end

  def jobs
    return unless @params.dig(:jobs, :enabled)&.to_boolean
    return unless @params.dig(:jobs, :host).present?

    jobs = {}
    jobs[:hosts] = @params.dig(:jobs, :host)
    jobs[:cmd] = @params.dig(:jobs, :cmd) if @params.dig(:jobs, :cmd).present?

    jobs
  end
end

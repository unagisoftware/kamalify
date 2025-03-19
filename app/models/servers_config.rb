# frozen_string_literal: true

class ServersConfig < BaseConfig
  def to_h
    servers = {}

    if @params[:host].present?
      servers[:web] = [ @params[:host] ]
    end

    # Ensure job section exists only if it has a host or cmd
    job_section = {}
    job_section[:hosts] = [ @params.dig(:jobs, :host) ] if @params.dig(:jobs, :host).present?
    job_section[:cmd] = @params.dig(:jobs, :cmd) if @params.dig(:jobs, :cmd).present?

    servers[:jobs] = job_section if job_section.present?

    servers
  end

  private

  def defaults
    {
      web: [ "100.100.100.100" ]
    }
  end
end

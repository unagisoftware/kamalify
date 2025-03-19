# frozen_string_literal: true

class YamlDocument
  def initialize(params = {})
    @params = params || {}
  end

  def output
    yaml_data = {
      service: @params[:name].presence || "your_service",
      image: @params[:docker_image].presence || "image/your_service",
      servers: ServersConfig.new(@params[:servers]).to_h,
      registry: RegistryConfig.new(@params[:registry]).to_h,
      builder: BuilderConfig.new(@params[:arch]).to_h,
      env: EnvConfig.new(@params[:env]).to_h
    }

    yaml_data.deep_stringify_keys.to_yaml(indentation: 2)
  end
end

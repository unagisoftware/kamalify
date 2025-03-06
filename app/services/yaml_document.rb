# frozen_string_literal: true

class YamlDocument
  require "yaml"

  def initialize(yaml_params = nil)
    @yaml_params = yaml_params
  end

  def output
    return default_yaml if @yaml_params.nil?

    yaml_data = {
      service: @yaml_params[:name].presence || "your_service",
      image: @yaml_params[:docker_image].presence || "image/your_service",
      servers: Array(@yaml_params[:server].presence || "192.168.0.1"),
      registry: {
        username: "registry-user-name",
        password: [ "KAMAL_REGISTRY_PASSWORD" ]
      },
      builder: {
        arch: @yaml_params[:arch].presence || "amd64"
      },
      env: {
        secret: [ "RAILS_MASTER_KEY" ]
      }
    }

    yaml_data.deep_stringify_keys.to_yaml(indentation: 2)
  end

  private

  def default_yaml
    yaml_data = {
      service: "your_service",
      image: "image/your_service",
      servers: Array("192.168.0.1"),
      registry: {
        username: "registry-user-name",
        password: [ "KAMAL_REGISTRY_PASSWORD" ]
      },
      builder: {
        arch: "amd64"
      },
      env: {
        secret: [ "RAILS_MASTER_KEY" ]
      }
    }

    yaml_data.deep_stringify_keys.to_yaml(indentation: 2)
  end
end

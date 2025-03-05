# frozen_string_literal: true

class YamlCreator 
  require "yaml"

  def initialize(yaml_params)
    @yaml_params = yaml_params
  end

  def call
    yaml_data = {
      service: @yaml_params[:name].presence || "your_service",
      image: @yaml_params[:docker_image].presence || "image/your_service",
      servers: Array(@yaml_params[:server].presence || "192.168.0.1"),
      registry: {
        username: "registry-user-name",
        password: ["KAMAL_REGISTRY_PASSWORD"]
      },
      builder: {
        arch: @yaml_params[:arch].presence || "amd64"
      },
      env: {
        secret: ["RAILS_MASTER_KEY"]
      }
    }

    yaml_data.deep_stringify_keys.to_yaml(indentation: 2).sub(/\A---\n/, '')
  end
end
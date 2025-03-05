class HomeController < ApplicationController
  def show
    @default_yaml = default_yaml
  end

  private

  def default_yaml
    yaml_data = {
      service: "your_service",
      image: "image/your_service",
      servers: Array("192.168.0.1"),
      registry: {
        username: "registry-user-name",
        password: ["KAMAL_REGISTRY_PASSWORD"]
      },
      builder: {
        arch: "amd64"
      },
      env: {
        secret: ["RAILS_MASTER_KEY"]
      }
    }

    yaml_data.deep_stringify_keys.to_yaml(indentation: 2).sub(/\A---\n/, '')
  end
end

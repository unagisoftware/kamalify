# frozen_string_literal: true

class YamlPreviewsController < ApplicationController
  def create
    @yaml_document = YamlDocument.new(yaml_params)
  end

  private

  def yaml_params
    params.permit(
      :name,
      :docker_image,
      builder: [ :arch, :remote ],
      proxy: [ :app_port, { hosts: [], ssl: [ :enabled ] } ],
      registry: [ :server, :username, :password ],
      servers: [ :host, { jobs: [ :enabled, :host, :cmd ] } ]
    )
  end
end

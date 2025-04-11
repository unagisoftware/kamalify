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
      builder: [ :arch ],
      registry: [ :username, :password ],
      servers: [ :host, { jobs: [ :enabled, :host, :cmd ] } ]
    )
  end
end

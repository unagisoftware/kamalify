# frozen_string_literal: true

class YamlPreviewsController < ApplicationController
  def create
    @yaml_document = YamlDocument.new(yaml_params)

    respond_to do |format|
      format.html { render :create }
      format.yaml {
        send_data @yaml_document.output,
            filename: "deploy.yml",
            type: "text/yaml",
            disposition: "attachment"
      }
    end
  end

  private

  def yaml_params
    params.permit(
      :name,
      :docker_image,
      builder: [ :arch, :remote ],
      proxy: [ :app_port, { hosts: [], ssl: [ :enabled ] } ],
      registry: [ :server, :username, :password ],
      servers: [ :host, { jobs: [ :enabled, :host, :cmd ] } ],
      env: { clear: [ :key, :value ], secret: [] },
      accessories: {
        postgres: [ :enabled, :host, :image, :port ]
      }
    )
  end
end

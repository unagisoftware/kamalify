class YamlPreviewsController < ApplicationController
  require "yaml"

  def create
    yaml_data = {
      user: {
        name: params[:name].presence || "N/A",
        age: params[:age].presence || "N/A",
        country: params[:country].presence || "N/A"
      }
    }

    @yaml_output = yaml_data.to_yaml
  end
end

# frozen_string_literal: true

class YamlPreviewsController < ApplicationController
  def create
    @yaml_output = YamlCreator.new(params).call
  end
end

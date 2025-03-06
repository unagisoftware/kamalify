# frozen_string_literal: true

class YamlPreviewsController < ApplicationController
  def create
    @yaml_document = YamlDocument.new(params)
  end
end

class HomeController < ApplicationController
  def show
    @yaml_document = YamlDocument.new
  end
end

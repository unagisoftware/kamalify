class HomeController < ApplicationController
  def about; end

  def show
    @yaml_document = YamlDocument.new
  end
end

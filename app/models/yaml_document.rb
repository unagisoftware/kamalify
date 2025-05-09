# frozen_string_literal: true

class YamlDocument
  def initialize(params = {})
    @params = params
  end

  def output
    yaml_data = {
      service: @params[:name].presence || "your_service",
      image: @params[:docker_image].presence || "image/your_service",
      servers: ServersConfig.new(@params.fetch(:servers, {})).to_h,
      proxy: ProxyConfig.new(@params.fetch(:proxy, {})).to_h,
      registry: RegistryConfig.new(@params.fetch(:registry, {})).to_h,
      builder: BuilderConfig.new(@params.fetch(:builder, {})).to_h,
      env: EnvConfig.new(@params.fetch(:env, {})).to_h,
      accessories: AccessoriesConfig.new(@params.fetch(:accessories, {})).to_h
    }

    raw_yaml = yaml_data.compact.deep_stringify_keys.to_yaml(indentation: 2)
    adjust_yaml_indentation(raw_yaml)
  end

  private

  def adjust_yaml_indentation(yaml_str, indent_size = 2)
    lines = yaml_str.lines
    adjusted_lines = []
    current_indent = 0

    lines.each do |line|
      if line =~ /^(\s*)([^:\s]+):\s*$/
        # Array key
        current_indent = $1.length + indent_size
        adjusted_lines << line
      elsif line =~ /^(\s*)-\s+/
        # Array element
        adjusted_lines << (" " * current_indent) + line.strip + "\n"
      else
        adjusted_lines << line
      end
    end

    adjusted_lines.join
  end
end

# frozen_string_literal: true

class EnvConfig < BaseConfig
  private

  def values
    {
      clear:,
      secret:
    }
  end

  def clear
    return if @params[:clear].blank?

    @params[:clear].each_with_object({}) do |item, hash|
      next if item.exclude?(":")

      key, value = item.split(":", 2)
      hash[key.strip] = value.strip
    end
  end

  def secret
    items = @params[:secret]

    items.presence && Array.wrap(items.compact_blank)
  end

  def vars_array(items)
  end

  def defaults
    { secret: [ "RAILS_MASTER_KEY" ] }
  end
end

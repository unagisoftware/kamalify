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

    @params[:clear].map do |clear_env|
      {
        "#{clear_env[:key].upcase}": clear_env[:value]
      }
    end
  end

  def secret
    items = @params[:secret]

    items.presence && Array.wrap(items.map(&:upcase).compact_blank)
  end

  def defaults
    { secret: [ "RAILS_MASTER_KEY" ] }
  end
end

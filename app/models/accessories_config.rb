# frozen_string_literal: true

class AccessoriesConfig < BaseConfig
  private

  def values
    {
      postgres:
    }
  end

  def defaults
    {}
  end

  def postgres
    return unless @params.dig(:postgres, :enabled)&.to_boolean

    {
      image: @params.dig(:postgres, :image),
      host: @params.dig(:postgres, :host),
      port: @params.dig(:postgres, :port).presence || "5432",
      env: {
        secret: [
          "POSTGRES_USER",
          "POSTGRES_PASSWORD"
        ]
      },
      volumes: [
        "postgres:/var/lib/postgresql/data"
      ]
    }
  end
end

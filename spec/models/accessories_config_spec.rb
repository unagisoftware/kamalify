# frozen_string_literal: true

require "rails_helper"

RSpec.describe AccessoriesConfig do
  describe "#to_h" do
    let(:params) { {} }

    subject do
      described_class.new(params).to_h
    end

    context "when no params are provided" do
      it "returns an empty hash" do
        expect(subject).to eq({})
      end
    end

    describe "postgres" do
      context "when postgres is disabled" do
        let(:params) do
          { postgres: { enabled: "0" } }
        end

        it "does not return postgres key" do
          expect(subject).to_not include(:postgres)
        end
      end

      context "when postgres is enabled and data is provided" do
        let(:params) do
          {
            postgres: {
              enabled: "1",
              image: "postgres:15.2",
              host: "10.0.0.1",
              port: "5433"
            }
          }
        end

        it "returns postgres with image only" do
          expect(subject[:postgres]).to include({ image: "postgres:15.2", host: "10.0.0.1" })
          expect(subject[:postgres]).to include(
            port: '5433',
            env: {
              secret: [
                "POSTGRES_USER",
                "POSTGRES_PASSWORD"
              ]
            },
            volumes: [
              "postgres:/var/lib/postgresql/data"
            ]
          )
        end
      end
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe RegistryConfig do
  describe "#to_h" do
    let(:params) { {} }

    subject do
      described_class.new(params).to_h
    end

    context "when no params are provided" do
      it "returns only the default values" do
        expect(subject).to eq({ username: "registry-user-name", password: [ "KAMAL_REGISTRY_PASSWORD" ] })
      end
    end

    context "when username is provided" do
      let(:params) do
        { username: "myusername" }
      end

      it "returns the provided username" do
        expect(subject).to include(username: "myusername")
      end
    end

    context "when password env var name is provided" do
      let(:params) do
        { password: "dockerhub_password" }
      end

      it "returns the provided password env var name" do
        expect(subject).to include(password: [ "dockerhub_password" ])
      end
    end

    context "when server is provided" do
      let(:params) do
        { server: "registry.example.com" }
      end

      it "returns the provided password env var name" do
        expect(subject).to include(server: "registry.example.com")
      end
    end
  end
end

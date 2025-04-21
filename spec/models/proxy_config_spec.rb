# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProxyConfig do
  describe "#to_h" do
    let(:params) { {} }

    subject do
      described_class.new(params).to_h
    end

    context "when no params are provided" do
      it "returns only the default values" do
        expect(subject).to eq({ hosts: "myapp.example.com" })
      end
    end

    context "when only one host is provided" do
      let(:params) do
        { hosts: [ "app.mydomain.com" ] }
      end

      it "returns the provided host" do
        expect(subject).to include(hosts: "app.mydomain.com")
      end
    end

    context "when more than one host is provided" do
      let(:params) do
        { hosts: [ "app.mydomain.com", "app2.mydomain.com" ] }
      end

      it "returns the provided hosts" do
        expect(subject).to include(hosts: [ "app.mydomain.com", "app2.mydomain.com" ])
      end
    end

    context "when ssl is enabled" do
      let(:params) do
        { ssl: { enabled: "1" } }
      end

      it "returns the ssl key with the value of true" do
        expect(subject).to include(ssl: true)
      end
    end

    context "when ssl is disabled" do
      let(:params) do
        { ssl: { enabled: "0" } }
      end

      it "returns the ssl key with the value of false" do
        expect(subject).to include(ssl: false)
      end
    end

    context "when app_port is provided" do
      let(:params) do
        { app_port: 3001 }
      end

      it "returns the provided app_port" do
        expect(subject).to include(app_port: 3001)
      end
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe YamlDocument do
  describe "#output" do
    let(:params) do
      {
        name: 'test',
        docker_image: 'custom/image',
        servers: { host: "localhost" },
        registry: { username: "test" },
        builder: { arch: "amd64" },
        env: { RAILS_ENV: "production" }
      }
    end

    subject do
      described_class.new(params).output
    end

    context "when params[:name] is not present" do
      before do
        params[:name] = nil
      end

      it "uses default value for name" do
        expect(subject).to include("service: your_service")
      end
    end

    context "when params[:name] is present" do
      before do
        params[:name] = "test"
      end

      it "uses provided value for name" do
        expect(subject).to include("service: test")
      end
    end

    context "when params[:docker_image] is not present" do
      before do
        params[:docker_image] = nil
      end

      it "uses default value for docker_image" do
        expect(subject).to include("image: image/your_service")
      end
    end

    context "when params[:docker_image] is present" do
      before do
        params[:docker_image] = "custom/image"
      end

      it "uses provided value for docker_image" do
        expect(subject).to include("image: custom/image")
      end
    end

    it "instantiates ServersConfig with correct params" do
      expect(ServersConfig).to receive(:new).with(params[:servers]).and_call_original
      subject
    end

    it "instantiates RegistryConfig with correct params" do
      expect(RegistryConfig).to receive(:new).with(params[:registry]).and_call_original
      subject
    end

    it "instantiates BuilderConfig with correct params" do
      expect(BuilderConfig).to receive(:new).with(params[:builder]).and_call_original
      subject
    end

    it "instantiates EnvConfig with correct params" do
      expect(EnvConfig).to receive(:new).with(params[:env]).and_call_original
      subject
    end
  end
end

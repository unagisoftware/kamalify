# frozen_string_literal: true

require "rails_helper"

RSpec.describe ServersConfig do
  describe "#to_h" do
    let(:params) { {} }

    subject do
      described_class.new(params).to_h
    end

    context "when no params are provided" do
      it "returns only the default values" do
        expect(subject).to eq({ web: "100.100.100.100" })
      end
    end

    context "when a web host is provided" do
      let(:params) do
        { host: "192.168.0.1" }
      end

      it "returns the provided web host" do
        expect(subject).to eq({ web: "192.168.0.1" })
      end
    end

    context "when jobs are disabled" do
      let(:params) do
        { jobs: { enabled: "0" } }
      end

      it "does not return jobs key" do
        expect(subject).to_not include(:jobs)
      end
    end

    context "when jobs are enabled but no host is provided" do
      let(:params) do
        { jobs: { enabled: "1" } }
      end

      it "does not return jobs key" do
        expect(subject).to_not include(:jobs)
      end
    end

    context "when jobs are enabled and host is provided" do
      let(:params) do
        {
          jobs: {
            enabled: "1",
            host: "10.0.0.1",
            cmd: "bin/jobs"
          }
        }
      end

      it "returns jobs with hosts only" do
        expect(subject[:jobs]).to eq({ hosts: "10.0.0.1", cmd: "bin/jobs" })
      end
    end
  end
end

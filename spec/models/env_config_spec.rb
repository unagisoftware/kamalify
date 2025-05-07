# frozen_string_literal: true

require "rails_helper"

RSpec.describe EnvConfig do
  describe "#to_h" do
    let(:params) { {} }

    subject do
      described_class.new(params).to_h
    end

    context "when no params are provided" do
      it "returns only the default values" do
        expect(subject).to eq({ secret: [ "RAILS_MASTER_KEY" ] })
      end
    end

    context "when secret vars are provided" do
      let(:params) do
        { secret: [ "FOO", "BAR" ] }
      end

      it "returns the secret vars as list" do
        expect(subject).to include(secret: [ "FOO", "BAR" ])
      end
    end

    context "when clear vars are provided" do
      let(:params) do
        { clear: [ { key: "FOO", value: "bar" }, { key: "BAR", value: "foo" } ] }
      end

      it "returns the provided host" do
        expect(subject[:clear]).to eq [ { FOO: "bar" }, { BAR: "foo" } ]
      end
    end
  end
end

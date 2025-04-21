# frozen_string_literal: true

require "rails_helper"

RSpec.describe BuilderConfig do
  describe "#to_h" do
    let(:params) { {} }

    subject do
      described_class.new(params).to_h
    end

    context "when no params are provided" do
      it "returns nil" do
        expect(subject).to be_nil
      end
    end

    context "when arch is provided" do
      let(:params) do
        { arch: "arm64" }
      end

      it "returns the provided arch" do
        expect(subject).to include({ arch: "arm64" })
      end
    end

    context "when remote is provided" do
      let(:params) do
        { remote: "ssh://root@111.111.111.111" }
      end

      it "returns the provided remote" do
        expect(subject).to include({ remote: "ssh://root@111.111.111.111" })
      end
    end
  end
end

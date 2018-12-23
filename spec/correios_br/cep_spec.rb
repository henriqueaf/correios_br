# frozen_string_literal: true

RSpec.describe CorreiosBr::CEP do
  subject { described_class }

  describe "Responds" do
    it { should respond_to(:get_address) }
  end

  describe "#request_timeout" do
    it "default is 5" do
      expect(CorreiosBr::CEP.request_timeout).to eq 5
    end

    context "when set timeout" do
      it "returns timeout" do
        CorreiosBr::CEP.request_timeout = 3
        expect(CorreiosBr::CEP.request_timeout).to eq 3
      end

      it "returns timeout in seconds (integer)" do
        CorreiosBr::CEP.request_timeout = 2.123
        expect(CorreiosBr::CEP.request_timeout).to eq 2
      end
    end
  end
end

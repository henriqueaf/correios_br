RSpec.describe CorreiosBr::CEP do
  subject { described_class }

  context "Responds" do
    it "to #get_address" do
      expect(subject).to respond_to(:get_address)
    end
  end
end

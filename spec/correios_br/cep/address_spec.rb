# frozen_string_literal: true

RSpec.describe CorreiosBr::CEP::Address do
  subject { CorreiosBr::CEP::Address }

  describe 'Responds to' do
    it { should respond_to(:search_address_by_zipcode) }
  end

  describe '@search_address_by_zipcode', vcr: { cassette_name: 'viacep_200' } do
    context 'with valid zipcode' do
      it 'will return a valid parsed json' do
        result = described_class.search_address_by_zipcode(zipcode: ViacepHelper::VALID_ZIPCODE)

        expect(result).to eq(
          CorreiosBr::CEP::Parser.parse_address(json_string: get_valid_json_response)
        )
      end
    end

    context 'with a invalid zipcode' do
      it 'will raise an exception' do
        expect {
          described_class.search_address_by_zipcode(zipcode: 'invalid')
        }.to raise_error(ArgumentError)
      end
    end
  end
end

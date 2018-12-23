# frozen_string_literal: true

RSpec.describe CorreiosBr::CEP::WebService do
  subject { CorreiosBr::CEP::WebService }

  context 'Responds to' do
    it { should respond_to(:get_address_by_zipcode) }
  end

  describe 'Constants' do
    it { should be_const_defined(:BASE_URL) }
  end

  describe '@get_address_by_zipcode' do
    context 'with valid zipcode' do
      it 'return response with http status 200', vcr: { cassette_name: 'viacep_200' } do
        response = subject.get_address_by_zipcode(zipcode: ViacepHelper::VALID_ZIPCODE)

        expect(response.body).not_to be_empty
        expect(response.code).to eq('200')
      end
    end

    context 'with invalid zipcode' do
      it 'return response with http status 400', vcr: { cassette_name: 'viacep_400' } do
        response = subject.get_address_by_zipcode(zipcode: 'invalid')
        expect(response.code).to eq('400')
      end
    end
  end
end

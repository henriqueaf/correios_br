# frozen_string_literal: true

RSpec.describe CorreiosBr::CEP::Parser do
  subject { CorreiosBr::CEP::Parser }

  describe 'Responds to' do
    it { should respond_to(:parse_address) }
  end

  describe 'Constants' do
    it { should be_const_defined(:ADDRESS_MAP) }
  end

  describe '@parse_address' do
    let(:zipcode)      { ViacepHelper::VALID_ZIPCODE }
    let(:address)      { 'Some logradouro' }
    let(:complement)   { 'Some complemento' }
    let(:neighborhood) { 'Some bairro' }
    let(:city)         { 'Some localidade' }
    let(:state)        { 'Some uf' }
    let(:unity)        { 'Some unidade' }
    let(:ibge)         { 'Some ibge' }
    let(:gia)          { 'Some gia' }
    let(:json_string) do
      {
        'cep' => zipcode,
        'logradouro' => address,
        'complemento' => complement,
        'bairro' => neighborhood,
        'localidade' => city,
        'uf' => state,
        'unidade' => unity,
        'ibge' => ibge,
        'gia' => gia
      }.to_json
    end
    let(:expected_json) do
      {
        zipcode: zipcode,
        address: address,
        complement: complement,
        neighborhood: neighborhood,
        city: city,
        state: state,
        unity: unity,
        ibge: ibge,
        gia: gia
      }
    end

    it 'return a JSON with new keys' do
      expect(
        subject.parse_address(json_string: json_string)
      ).to eq(expected_json)
    end
  end
end

# frozen_string_literal: true

require 'json'

module CorreiosBr
  module CEP
    # Public: A Class to parse API result
    class Parser
      ADDRESS_MAP = {
        'cep' => :zipcode,
        'logradouro' => :address,
        'complemento' => :complement,
        'bairro' => :neighborhood,
        'localidade' => :city,
        'uf' => :state,
        'unidade' => :unity,
        'ibge' => :ibge,
        'gia' => :gia
      }.freeze

      def self.parse_address(json_string:)
        json_result = JSON.parse(json_string)

        json_result.keys.each do |key|
          json_result[ADDRESS_MAP[key]] = json_result[key]
          json_result.delete(key)
        end

        json_result
      end
    end
  end
end

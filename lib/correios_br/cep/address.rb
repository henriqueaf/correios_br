# frozen_string_literal: true

require 'correios_br/cep/web_service'
require 'correios_br/cep/parser'

module CorreiosBr
  module CEP
    class Address
      def self.search_address_by_zipcode(zipcode:)
        zipcode = zipcode.to_s.strip
        validate_zipcode(zipcode)

        response = web_service.get_address_by_zipcode(zipcode: zipcode)
        return nil if response.code != '200'

        parser.parse_address(json_string: response.body)
      end

      def self.web_service
        @web_service ||= CorreiosBr::CEP::WebService
      end

      def self.parser
        @parser ||= CorreiosBr::CEP::Parser
      end

      def self.validate_zipcode(zipcode)
        raise ArgumentError, 'zipcode is required' if zipcode.empty?

        raise ArgumentError,
              'zipcode in invalid format (valid format: 00000000 or \
              00000-000)' unless zipcode.match(/^[0-9]{8}$/) ||
                                 zipcode.match(/^[0-9]{5}-[0-9]{3}$/)
      end

      private_class_method :web_service, :parser, :validate_zipcode
    end
  end
end

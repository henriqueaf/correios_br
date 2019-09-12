# frozen_string_literal: true

require 'net/http'
require 'uri'

module CorreiosBr
  module CEP
    # Public: A Class to send request to the address API
    class WebService
      BASE_URL = 'https://viacep.com.br/ws'

      def self.get_address_by_zipcode(zipcode:, request_timeout: CorreiosBr::CEP.request_timeout)
        uri = URI.parse("#{BASE_URL}/#{zipcode}/json")

        request(uri: uri, request_timeout: request_timeout)
      end

      def self.request(uri:, request_timeout:)
        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
          request = Net::HTTP::Get.new uri
          http.read_timeout = request_timeout
          http.request request
        end
      end

      private_class_method :request
    end
  end
end

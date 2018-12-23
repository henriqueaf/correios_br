# frozen_string_literal: true

require 'net/http'
require 'uri'

module CorreiosBr
  module CEP
    class WebService
      BASE_URL = 'https://viacep.com.br/ws'.freeze

      def self.get_address_by_zipcode(zipcode:, request_timeout: CorreiosBr::CEP.request_timeout)
        uri = URI.parse("#{BASE_URL}/#{zipcode}/json")

        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
          request = Net::HTTP::Get.new uri
          http.read_timeout = request_timeout
          http.request request
        end
      end
    end
  end
end

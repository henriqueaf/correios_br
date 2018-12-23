# frozen_string_literal: true

module CorreiosBr
  module CEP
    module Config
      DEFAULT_REQUEST_TIMEOUT = 5 # seconds

      attr_writer :request_timeout

      def request_timeout
        (@request_timeout ||= DEFAULT_REQUEST_TIMEOUT).to_i
      end

      def configure
        yield self if block_given?
      end
    end
  end
end

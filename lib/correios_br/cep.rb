# frozen_string_literal: true

require 'correios_br/cep/config'
require 'correios_br/cep/address'

module CorreiosBr
  # Public: A module that act as an interface for the CEP utilities.
  module CEP
    extend CorreiosBr::CEP::Config

    def self.get_address(zipcode)
      Address.search_address_by_zipcode(zipcode: zipcode)
    end
  end
end

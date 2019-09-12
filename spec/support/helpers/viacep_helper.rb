# frozen_string_literal: true

module ViacepHelper
  VALID_ZIPCODE = '08090-284'

  def valid_json_response
    YAML.load_file('spec/fixtures/vcr/viacep_200.yml')['http_interactions']
        .first['response']['body']['string']
  end
end

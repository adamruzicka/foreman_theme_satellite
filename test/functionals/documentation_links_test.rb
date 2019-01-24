require 'test_plugin_helper'

require 'net/http'

class DocumentationLinksTest < ActiveSupport::TestCase
  setup do
    WebMock.allow_net_connect!
  end

  teardown do
    WebMock.disable_net_connect!
  end

  ThemeApplicationHelper::USER_GUIDE_DICTIONARY.each do |key, doc_address|
    test "#{key} entry is valid" do
      uri = URI(doc_address)
      res = Net::HTTP.get_response(uri)

      # it can be either 200 or 302
      refute_equal '404', res.code, "Documentation link #{doc_address} was not found"
    end
  end
end

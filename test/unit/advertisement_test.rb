require 'test_helper'

class AdvertisementTest < ActiveSupport::TestCase
  
  test "validations 1" do
    a = Advertisement.new
    assert_equal a.valid?, false
  end
  
  test "validations 2" do
    a = Advertisement.new(:name => "test", :ident => "abc", :targeturl => "http://example.com")
    assert a.valid?
  end
  
end

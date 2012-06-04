require 'test_helper'

class AdvertisementsControllerTest < ActionController::TestCase
  
  test "route redirect" do
    assert_generates "/redirect/foo42bar", { :controller => "advertisements", :action => "show", :ident => "foo42bar"  }
  end

end

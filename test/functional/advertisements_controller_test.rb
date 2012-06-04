require 'test_helper'

class AdvertisementsControllerTest < ActionController::TestCase
  
  test "route redirect" do
    assert_generates "/redirect/foo42bar", { :controller => "advertisements", :action => "show", :ident => "foo42bar"  }
  end
  
  test "unknown advertisement" do
    
    assert_difference('Event.count',0) do
      get(:show, {:ident => "unknown"})
      assert_response :success
    end
    
  end
  
  test "example advertisement" do
    assert_difference('Event.count') do
      get(:show, {
        :ident => "foo42bar", 
        :t => 'c',
        :atime => 5.seconds.ago
      })
    end
    
    assert_redirected_to assigns(:ad).targeturl
    assert_response 302
    
    assert assigns(:event).uniqueuser
    assert assigns(:event).user_agent
    assert assigns(:event).ip
    
    assert_equal assigns(:event).ad_ident, assigns(:ad).ident
    assert_equal assigns(:event).uniqueuser, assigns(:uniqueuser)
    assert_equal assigns(:event).event_type, 'c'
  end
  
  test "fraud click - to short time between click and advertisement generation" do
    
    get(:show, {
      :ident => "foo42bar", 
      :t => 'c',
      :atime => 1.seconds.ago
    })
    
    assert Event.last.fraud?
  end
  

end

require 'test_helper'


# fixtures load from fixtures/events.yml

class EventTest < ActiveSupport::TestCase
  
  test "typical event" do
    assert_equal events(:normal).fraud?, false
  end
  
  test "fraud - same ip" do
    assert events(:same_ip_second).fraud?
  end
  
  test "fraud - same uniqueuser" do
    assert events(:same_uu_second).fraud?
  end
  
  test "out of time - same ip" do
    e = events(:same_ip_first)
    e.ad_gen_time = 35.hours.ago - 10.seconds
    e.created_at = 35.hours.ago
    e.save!
    assert_equal events(:same_ip_second).fraud?, false
  end
  
  test "out of time - same uniqueuser" do
    e = events(:same_uu_first)
    e.ad_gen_time = 35.hours.ago - 10.seconds
    e.created_at = 35.hours.ago
    e.save!
    assert_equal events(:same_uu_second).fraud?, false
  end
  
end

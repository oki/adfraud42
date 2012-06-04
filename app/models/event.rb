class Event < ActiveRecord::Base
  attr_accessible :ad_gen_time, :ad_ident, :event_type, :ip, :targeturl, :uniqueuser, :user_agent
end

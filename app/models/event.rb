class Event < ActiveRecord::Base
  attr_accessible :ad_gen_time, :ad_ident, :event_type, :ip, :uniqueuser, :user_agent
  
  # event type: click
  scope :click, where(:event_type => :c)
  
  # events from last 24 hours
  scope :one_day, where('created_at >= ?', 24.hours.ago)
  
  # very simple rules to detect fraud events:
  
  # time limit between ad generation and make event
  AD_GEN_LIMIT = 3
  
  # return true/false if event is fraud, checking rules with ip/unuqueuser and advertisement generation time
  def fraud?
    (frauded.count >= 1) || ((created_at - ad_gen_time) < AD_GEN_LIMIT)
  end

  # return suspected events with the same ip or uniqueuser
  def frauded
    Event.click.one_day.where('id != ? AND (ip = ? or uniqueuser = ?)', self.id, self.ip, self.uniqueuser)
  end
  
end

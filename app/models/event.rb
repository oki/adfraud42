class Event < ActiveRecord::Base
  attr_accessible :ad_gen_time, :ad_ident, :event_type, :ip, :uniqueuser, :user_agent
  
  scope :click, where(:event_type => :c)
  scope :one_day, where('created_at >= ?', 24.hours.ago)
  
  def fraud?
    (frauded.count >= 1) || ((created_at - ad_gen_time) < 3)
  end

  def frauded
    Event.click.one_day.where('id != ? AND (ip = ? or uniqueuser = ?)', self.id, self.ip, self.uniqueuser)
  end
  
end

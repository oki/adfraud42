class Advertisement < ActiveRecord::Base
  attr_accessible :ident, :name, :targeturl
  
  # example validations
  validates_presence_of :ident
  validates_presence_of :targeturl
  validates_presence_of :targeturl
end

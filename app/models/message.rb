class Message < ActiveRecord::Base
  validates :text, :presence => true
  attr_accessible :text, :active
end
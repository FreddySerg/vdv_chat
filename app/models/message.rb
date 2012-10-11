class Message < ActiveRecord::Base
  validates :text, :presence => true
  attr_accessible :text, :active

  def self.get_messages
    active = Message.where(:active => true).order("updated_at ASC")
    unactive = Message.where(:active => false).order("updated_at ASC")
    return {active: active, unactive: unactive}
  end
end
class SendMessage
  @queue = :sending_message

  def self.perform channel, id, messages, status
    message = {:channel => channel, :data => [id, messages, status], :ext => {:token => FAYE_TOKEN}}
    uri = URI.parse(FAYE_URL)
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
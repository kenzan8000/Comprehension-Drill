require 'apns'

class Tasks::PostingNotificationTask

  def self.execute()
    device_tokens = ['aad105d2b7c36b3b47ed3de56254bf0dac381290fefe0db4314dbd79b278d969']
    alert = "test#{DateTime.now}"
    self.post_notifications_via_apns(device_tokens, alert)
  end

  def self.post_notifications_via_apns(device_tokens, alert)
    APNS.host = 'gateway.push.apple.com'
    APNS.pem  = "#{Rails.root}/path/to/apple_#{Rails.env}.pem"
    APNS.port = 2195
    device_tokens.each do | device_token |
      APNS.send_notification(device_token, :alert => alert, :badge => 1, :sound => 'default')
    end
  end

end

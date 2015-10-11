require 'apns'

class Tasks::PostingNotificationTask

  def self.execute()
    device_tokens = ['d36f1854e1cc97d21dc9787b4759b3e25345ee03ddc0a127a68ca8b7820f99a2']
    alert = "test##{DateTime.now}"
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

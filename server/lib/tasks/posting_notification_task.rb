require 'apns'

class Tasks::PostingNotificationTask

  def self.execute()
    device_tokens = ['ddf561e07d0211905a0011dae3810067fc826cd622c297fb6ed7614653737167']
    alert = "test#{DateTime.now}"
    self.post_notifications_via_apns(device_tokens, alert)
  end

  def self.post_notifications_via_apns(device_tokens, alert)
    APNS.host = (Rails.env == 'production') ? 'gateway.push.apple.com' : 'gateway.sandbox.push.apple.com'
    APNS.pem  = "#{Rails.root}/path/to/apple_#{Rails.env}.pem"
    APNS.port = 2195
    device_tokens.each do | device_token |
      APNS.send_notification(device_token, :alert => alert, :badge => 1, :sound => 'default')
    end
  end

end

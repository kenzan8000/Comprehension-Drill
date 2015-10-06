class User < ActiveRecord::Base
  validates_presence_of :device_token, :language
end

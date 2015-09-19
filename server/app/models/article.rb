class Article < ActiveRecord::Base
  belongs_to :web_site
  validates_presence_of :web_site_id
end

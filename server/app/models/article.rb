class Article < ActiveRecord::Base
  belongs_to :web_site
  validates_presence_of :web_site_id, :link, :title, :language, :pub_date, :body, :question
end

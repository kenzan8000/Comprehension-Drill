class WebSite < ActiveHash::Base
  self.data = [
    # id, link, title, description, language, rss
    { :id => 1, :link => 'http://www.breakingnewsenglish.com', :title => 'www.BreakingNewsEnglish.com', :description => 'Simple news casts for learners of English. Read the news article at http://www.breakingnewsenglish.com/ . You can also try some vocabulary exercises.', :language => 'en-us', :rss => 'http://www.breakingnewsenglish.com/bne.rss' }
  ]
end

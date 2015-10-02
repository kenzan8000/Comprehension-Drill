class WebSite < ActiveHash::Base

  self.data = [
    # id, link, title, description, language, rss
    {
      :id => 1,
      :link => 'http://www.breakingnewsenglish.com',
      :title => 'www.BreakingNewsEnglish.com',
      :description => 'Simple news casts for learners of English. Read the news article at http://www.breakingnewsenglish.com/ . You can also try some vocabulary exercises.',
      :language => 'en-us',
      :rss => 'http://www.breakingnewsenglish.com/bne.rss',
      :article_body_xpath => '/html/body/center/table[4]/tr[1]/td/div[1]/table[2]/tr/td[1]/blockquote',
      :article_question_xpath => '/html/body/center/table[4]/tr[2]/td/blockquote[3]/table[2]'
    }
  ]
end

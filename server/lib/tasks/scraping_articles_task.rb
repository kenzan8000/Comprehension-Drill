require 'yasuri'
require 'json'

class Tasks::ScrapingArticlesTask

  def self.execute
    web_sites  = WebSite.all
    web_sites.each do |web_site|
      agent = Mechanize.new
      page = agent.get('http://www.breakingnewsenglish.com/1509/150929-the-lost-city-of-z.html')
      #page = agent.get('http://www.breakingnewsenglish.com/1509/150926-selfies.html')
      init_page = Yasuri.pages_init '/html', limit:1 do
        text_body web_site.article_body_xpath
        text_question web_site.article_question_xpath
      end
      json = init_page.inject(agent, page)
      jj json
    end
  end

end

require 'yasuri'
require 'json'
require 'simple-rss'
require 'open-uri'

class Tasks::ScrapingArticlesTask

  def self.execute
    web_sites  = WebSite.all
    web_sites.each do |web_site|
      # parse a rss
      rss_items = self.parse_rss web_site.rss
      # scrape the web sites
      rss_items.each do |rss_item|
        self.scrape(web_site, rss_item)
      end
    end
  end

  def self.parse_rss(rss_link)
    rss = SimpleRSS.parse open(rss_link)
    rss.items
  end

  def self.scrape(web_site, rss_item)
    agent = Mechanize.new
    page = agent.get(rss_item.link)
    init_page = Yasuri.pages_init '/html', limit:1 do
      text_body web_site.article_body_xpath
      text_question web_site.article_question_xpath
    end
    json = init_page.inject(agent, page)
    jj json
  end

end

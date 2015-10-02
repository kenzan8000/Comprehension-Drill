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
        break
      end
    end
  end

  def self.parse_rss(rss_link)
    rss = SimpleRSS.parse open(rss_link)
    rss.items
  end

  def self.scrape(web_site, rss_item)
    body_xpaths = web_site.article_body_xpath.split(',')
    question_xpaths = web_site.article_question_xpath.split(',')

    # scrape
    agent = Mechanize.new
    page = agent.get(rss_item.link)
    scraping_rule = Yasuri.pages_init '/html', limit:1 do
      body_xpaths.each_with_index do |xpath, i|
        send("text_body_#{i}", xpath)
      end
      question_xpaths.each_with_index do |xpath, i|
        send("text_question_#{i}", xpath)
      end
    end
    article_jsons = scraping_rule.inject(agent, page)

    # make article
    article_jsons.each do |article_json|
      #puts rss_item.title
      #puts '///////////////////////////'
      #puts article_json['body'].gsub(/[\t]|[\n]{2,}/, '').gsub(/[\s]{2,}/, "\n\n")
      #puts '///////////////////////////'
      #puts article_json['question'].gsub(/[\t]|[\n]{2,}/, '').gsub(/[\s]{2,}/, '')
    end
  end

end

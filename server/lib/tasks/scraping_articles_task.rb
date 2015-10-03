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
        next if Article.exists?(:link => rss_item.link)
        article = self.scrape(web_site, rss_item)
        article.save if article.valid?
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
    article = Article.new
    article_jsons.each do |article_json|
      article.web_site_id = web_site.id
      article.link = rss_item.link
      article.title = rss_item.title
      article.language = web_site.language
      article.pub_date = rss_item.pubDate
      article.body = self.integrate(article_json, 'body')
      article.question = self.integrate(article_json, 'question')
    end
    article
  end

  def self.integrate(hash, hash_key)
    result = ''
    i = 0
    while hash.has_key?("#{hash_key}_#{i}") do
      result += "\n\n" if i != 0
      result += hash["#{hash_key}_#{i}"].strip
      i = i + 1
    end
    result
  end

end

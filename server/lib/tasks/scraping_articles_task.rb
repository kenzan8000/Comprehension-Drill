require 'yasuri'
require 'json'

class Tasks::ScrapingArticlesTask

  def self.execute
    agent = Mechanize.new
    page = agent.get('http://qiita.com/tags/Ruby/items')

    init_page = Yasuri.pages_init '//*[@id="main"]/div/div/div[1]/section/div[2]/ul/li[7]/a', limit:3 do
      text_page_idx '//*[@id="main"]/div/div/div[1]/section/div[2]/ul/li[@class="active"]/a', proc: :to_i

      struct_entries '//*[@id="main"]/div/div/div[1]/section/div[1]/article' do
        text_author './div[2]/div[1]/a'
        text_date   './div[2]/div[1]/text()', truncate:/posted on (.+)/
        text_title  './div[2]/div[2]/h1/a'
        text_stock_count   './div[3]/ul/li[1]',   proc: :to_i
        text_comment_count './div[3]/ul/li[2]/a', proc: :to_i
      end
    end

    jj init_page.inject(agent, page)
  end

end

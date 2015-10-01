require 'yasuri'
require 'json'

class Tasks::ScrapingArticlesTask

  def self.execute
    agent = Mechanize.new
    #page = agent.get('http://www.breakingnewsenglish.com/1509/150929-the-lost-city-of-z.html')
    page = agent.get('http://www.breakingnewsenglish.com/1509/150926-selfies.html')

    init_page = Yasuri.pages_init '/html', limit:1 do
      text_body '/html/body/center/table[4]/tr[1]/td/div[1]/table[2]/tr/td[1]/blockquote'
      text_question '/html/body/center/table[4]/tr[2]/td/blockquote[3]/table[2]'
    end

    json = init_page.inject(agent, page)
    jj json
  end

end

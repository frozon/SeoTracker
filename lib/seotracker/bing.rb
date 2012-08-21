class Seotracker::Bing < Seotracker
  protected

  def self.search_url(region = nil)
    region = 'www.bing.com' if region.nil?
    "http://#{region}/search?go=&qs=n&form=QBLH&filt=all&pq=cathy+dudzinski&sc=1-15&sp=-1&sk="
  end

  def parse(word, start = 0, region = nil)
    page = @agent.get(self.class.search_url(region), q: word, first: start)
    page.root.xpath('/html/body/div/div/div[2]/div[3]/div/div/div[2]/div/div/div/ul/li/div/div/div[1]/h3/a')
  end
end
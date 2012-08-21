class Seotracker::Yahoo < Seotracker
  protected

  def self.search_url(region = nil)
    region = 'search.yahoo.com' if region.nil?
    "http://#{region}/search?"
  end

  def parse(word, start = 0, region = nil)
    page = @agent.get(self.class.search_url(region), p: word, b: start)
    # page.root.xpath('/html/body/div/div[3]/div[2]/div[2]/div/div/div/div[3]/ol/li/div/div/h3/a')
    page.root.xpath('//*[@id="main"]/div[3]/ol/li/div/div/h3/a')
  end
end
class HikingInfo::Scraper
attr_accessor :name, :location, :features, :miles, :elevation_gain, :difficulty, :link




  def self.all
    
      self.scrape_trails
      
  end
  
  def self.scrape_trails
     
    trails = []
    trails  << self.scrape
    
     
     
     
  
      
      trails
     
  end
  
  def self.scrape
    doc = Nokogiri::HTML(open("http://www.rockymountainhikingtrails.com/rocky-mountain-national-park-hikes.htm"))
    
    trail = self.new
    trailss = doc.css("tbody").css("tr")
    
    
    
    # trail.name = doc.css("tbody").css("tr").css("td").css("span")
    
   
    
    trailss.each do |key|
      trail.name = key.css("td").css("span").text
      trail.location = key.css("td")[1].css("font").text
      trail.features = key.css("font")[2].text
      trail.miles = key.css(".xl67").css("font").text
      trail.elevation_gain = key.css(".xl68").css("font").text
      trail.difficulty = key.css(".xl70").css("font").text
      trail.link = key.css(".xl66").css("a").map {|link| link['href']}
      
      
     
    end
    trail
    
  end
  
 
  



  
  
end
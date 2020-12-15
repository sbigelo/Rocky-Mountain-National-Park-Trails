class HikingInfo::Trails
attr_accessor :name, :location, :features, :miles, :elevation_gain, :difficulty, :link


  def self.all
    
      self.scrape_trails
      
  end
  
  def self.scrape_trails
     
    trails = []
    trails  << self.scrape
    
     
     
     
    # trail_1 = self.new
    #   trail_1.name = "Adams Falls"
    #   trail_1.location = "West Side"
    #   trail_1.features = "Waterfalls, Fall Aspens"
    #   trail_1.miles = "0.9"
    #   trail_1.elevation_gain = "113"
    #   trail_1.difficulty = "1.13"
    #   trail_1.link = "http://www.rockymountainhikingtrails.com/adams-falls.htm"
      
      trails
  end
  
  def self.scrape
    doc = Nokogiri::HTML(open("http://www.rockymountainhikingtrails.com/rocky-mountain-national-park-hikes.htm"))
    trailss = doc.css("tbody").css("tr")
    
    trail = self.new
    trail.name = doc.css("tbody").css("tr").css("td").css("span")
    
    nodeset = doc.css("tbody").css('a')          
    trail.link = nodeset.map {|element| element["href"]}.compact
    
    trailss.each do |key|
      trail.location = key.css("a").css("span").text
      trail.features = key.css("font")[1].text
      trail.miles = key.css("font")[2].text
      trail.elevation_gain = key.css("font")[3].text
      trail.difficulty = key.css("font")[4].text
      
     
    end
  end
  
  



  
  
end
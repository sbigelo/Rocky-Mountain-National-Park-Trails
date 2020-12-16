class HikingInfo::Trails

attr_accessor :name, :location, :features, :miles, :elevation_gain, :difficulty, :link


  @@all = []

  def initialize(name, opener, date, time, tickets_URL)
    @name = name
    @location = location
    @features = features
    @miles = miles
    @elevation_gain = elevation_gain
    @difficulty = difficulty
    @link = link
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_index(index)
    @@all[index]
  end



  
  def self.scrape
    doc = Nokogiri::HTML(open("http://www.rockymountainhikingtrails.com/rocky-mountain-national-park-hikes.htm"))
    
    # trail = self.new
    trailss = doc.css("tbody").css("tr")
    
    trailss.each do |key|
      name = key.css("td").css("span").text
      location = key.css("td")[1].css("font").text
      features = key.css("font")[2].text
      miles = key.css(".xl67").css("font").text
      elevation_gain = key.css(".xl68").css("font").text
      difficulty = key.css(".xl70").css("font").text
      link = key.css(".xl66").css("a").map {|link| link['href']}
      
      
     
    end
    # trail
    
  end
end
 
    # def self.all
    
  #     self.scrape_trails
      
  # end
  
  # def self.scrape_trails
     
  #   trails = []
  #   trails  << self.scrape

  #     trails
     
  # end



  

  

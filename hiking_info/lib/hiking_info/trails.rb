class HikingInfo::Trails
attr_accessor :name, :location, :features, :miles, :elevation_gain, :difficulty, :link


  def self.all
    # puts "Here is the list of hiking trails to choose from:"
    # puts "1. text 2. text"
      
      trail_1 = self.new
      trail_1.name = "1"
      trail_1.location = "West Side"
      trail_1.features = "Waterfalls, Fall Aspens"
      trail_1.miles = "0.9"
      trail_1.elevation_gain = "113"
      trail_1.difficulty = "1.13"
      trail_1.link = "http://www.rockymountainhikingtrails.com/adams-falls.htm"
      
      [trail_1]
  end
  
end
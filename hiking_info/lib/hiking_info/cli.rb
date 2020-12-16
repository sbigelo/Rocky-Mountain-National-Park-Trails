
class HikingInfo::CLI
 
  def call
    puts "Welcome to the RMNP Trails Guide!"
    list_trails
    trails_info
  end
  
  def list_trails
    puts "Here is a list of the hiking trails:"
    @trails = HikingInfo::Scraper.all
    @trails.each.with_index(1) do |trail, i|
      puts "#{i}. #{trail.name}"
    end
  end
  
  
  
  def trails_info
    input = nil
    while input != "exit"
    puts "Please enter a number that is associated with the trail that you would like to know more about. If you would like to exit, press 'exit'"
    input = gets.strip.downcase
    
    if input.to_i > 0
      trail =  @trails[input.to_i - 1]
      puts "Trail: #{trail.name}."
      puts "Location: #{trail.location}." 
      puts "Features: #{trail.features}." 
      puts "Miles: #{trail.miles}." 
      puts "Elevation Gain: #{trail.elevation_gain}."
      puts "Difficulty: #{trail.difficulty}."
      puts "Link: #{trail.link}"
    elsif input == "list"
      list_trails
    else
      puts "Invalid input. Type 'list' or 'exit'."
      end
    end
  end
  
  
 

  
  
end
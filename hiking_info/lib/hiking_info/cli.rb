
class HikingInfo::CLI
  
  def call
    puts "Welcome to the RMNP Trails Guide!"
    list_trails
    trails_info
  end
  
  def list_trails
    puts "Here is a list of the hiking trails:"
    @trails = HikingInfo::Trails.all
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
      the_trails =  @trails[input.to_i - 1]
      puts "#{the_trails.name}. Location: #{the_trails.location}. Features: #{the_trails.features}. Miles: #{the_trails.miles}. Elevation Gain: #{the_trails.elevation_gain}. Difficulty: #{the_trails.difficulty}. Link: #{the_trails.link}."
    elsif input == "list"
      list_trails
    else
      puts "Invalid input. Type 'list' or 'exit'."
      end
    end
  end
  
  
end

class HikingInfo::CLI
  
  def call
    puts "Welcome to the RMNP Trails Guide!"
    list_trails
    trails_info
  end
  
  def list_trails
    puts "Here is a list of the hiking trails:"
    @trails = HikingInfo::Trails.all
    @trails.each.with_index(1) do |key, i|
      puts "#{i}. #{key.name}. Location: #{key.location}. Features: #{key.features}. Miles: #{key.miles}. Elevation Gain: #{key.elevation_gain}. Difficulty: #{key.difficulty}. Link: #{key.link}."
    end
  end
  
  
  
  def trails_info
    input = nil
    while input != "exit"
    puts "Please enter a number that is associated with the trail that you would like to know more about."
    input = gets.strip.downcase
    
    if input.to_i > 0
      the_trails = 
      puts @trails[input.to_i - 1]
    elsif input == "list"
      list_trails
    else
      puts "Invalid input. Type 'list' or 'exit'."
      end
    end
  end
  
  
end

class HikingInfo::CLI
  
  def call
    puts "Welcome to the RMNP Trails Guide!"
    list_trails
    trails_info
  end
  
  def list_trails
    puts "Here is a list of the hiking trails:"
    @trails = HikingInfo::Trails.all
  end
  
  
  def trails_info
    input = nil
    while input != "exit"
    puts "Please enter a number that is associated with the trail that you would like to know more about."
    input = gets.strip.downcase
    case input 
    when "1"
      puts "more on 1"
    when "2"
      puts "more on 2"
    when "list"
      list_trails
    else 
      puts "Invalid input. Type 'list' or 'exit'."
      end
    end
  end
  
  
end

class HikingInfo::CLI
 
  def call
    HikingInfo::Scraper.scrape
    welcome
    list_trails
    trails_info
  end
  
  def welcome
    puts ""
    puts "   //                                              \\\\"
    puts "  ////                                          \\\\\\\\"
    puts " ///   Welcome to the RMNP Hiking Trails Guide!    \\\\\\"
    puts "////                                              \\\\\\\\"
    puts ""
    puts "To see the list of hiking trails, type list."
    puts "To leave, type exit."
  end
  
  def list_trails
    input = gets.strip.downcase
    if input == "list"
      puts ""
      trails = HikingInfo::Trails.all
      trails.each.with_index(1) {|trail, i| puts "#{i}. #{trail.name}"}
    elsif input == "exit"
      system clear or system "cls"
      exit
    else 
      puts "Incorrect input. To head out, type 'exit' or to see the list of Hiking Trails type 'list'."
      list_trails
   
    # puts "Here is a list of the hiking trails:"
    # @trails = HikingInfo::Scraper.all
    # @trails.each.with_index(1) do |trail, i|
    #   puts "#{i}. #{trail.name}"
    end
  end
  
  
  def trails_info
    
    puts "Please enter a number that is associated with the trail that you would like to know more about. If you would like to exit, type 'exit'"
    input = gets.strip.downcase
    
    if input.to_i > 0
      trail =  HikingInfo::Trails.find_by_index(input.to_i - 1)
      puts "______________________________________________________________________________________"
      puts "Trail: #{trail.name}."
      puts "Location: #{trail.location}." 
      puts "Features: #{trail.features}." 
      puts "Miles: #{trail.miles}." 
      puts "Elevation Gain: #{trail.elevation_gain}."
      puts "Difficulty: #{trail.difficulty}."
      puts "Link: #{trail.link}"
      puts "______________________________________________________________________________________"
      trails_info
    elsif input == "list"
      list_trails
    elsif input == "exit"
      puts "Goodbye and thanks for visiting!"
      system "clear" or system "cls"
    else
      puts "Invalid input. Type 'list' or 'exit'."
      trails_info
      end
    end
end
  

  

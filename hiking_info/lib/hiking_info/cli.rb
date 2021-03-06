require 'pry'
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
    puts "     To see the list of hiking trails, type list."
    puts ""
  end

  def list_trails
    input = gets.strip.downcase
    if input == "list"
      puts ""
      trails = HikingInfo::Trails.all
      trails.slice!(0)
      trails.slice!(53)
      trails.slice!(73)
        # binding.pry
      trails.each.with_index(1) {|trail, i| puts "#{i}. #{trail.name}"}
    # elsif input == "bounce"
    #   exit
    else
      puts "Incorrect input. To see the list of Hiking Trails type 'list'."
      list_trails
    end
  end

  def exit
    puts ""
    puts "Goodbye and thanks for visiting!"
    puts ""
    system "cls"
  end

  def trails_info
    # input = nil
    # while input != "exit"
    puts "Please enter a number that is associated with the trail that you would like to know more about. If you would like to exit, type 'exit'"
    input = gets.strip.downcase

    if input.to_i > 0 && input.to_i < 81
      trail =  HikingInfo::Trails.find_by_index(input.to_i - 1)
      puts "________________________________________________________________________________"
      puts "Trail: #{trail.name}."
      puts "Location: #{trail.location}."
      puts "Features: #{trail.features}."
      puts "Miles: #{trail.miles}."
      puts "Elevation Gain: #{trail.elevation_gain}."
      puts "Difficulty: #{trail.difficulty}."
      puts "Link: #{trail.link}"
      puts "________________________________________________________________________________"
      trails_info
    elsif input == "list"
      trails_info
    elsif input == "exit"
      exit
    else
      puts "Invalid input. Remeber to type 'list' or 'exit'."
      puts ""
      list_trails
      end
    # end
  end
end

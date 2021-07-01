require 'pry'
class HikingInfo::Trails

attr_accessor :name, :location, :features, :miles, :elevation_gain, :difficulty, :link


  @@all = []

  def initialize(name, location, features, miles, elevation_gain, difficulty, link)
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

end
 




  

  

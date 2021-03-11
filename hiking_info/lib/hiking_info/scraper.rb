class HikingInfo::Scraper

  def self.scrape
    doc = Nokogiri::HTML(open("http://www.rockymountainhikingtrails.com/rocky-mountain-national-park-hikes.htm"))
    trailss = doc.css("tbody").css("tr")

    trailss.each do |key|
<<<<<<< HEAD
      name = key.css("td").css("span").text
=======
      name = key.css("td").css("span").text || key.css("xl71").css("font").text
      # != nil ? key.css("td").css("span").text : key.css(".xl71").css("font").text
>>>>>>> 67d1de412f04ab18234ba32b871f74a4c547a099
      location = key.css("td")[1].css("font").text
      features = key.css("font")[2].text
      miles = key.css(".xl67").css("font").text
      elevation_gain = key.css(".xl68").css("font").text
      difficulty = key.css(".xl70").css("font").text
<<<<<<< HEAD
      link =  key.css(".xl72, .xl66, .xl71, .xl74").css("a").map {|link| link['href']}
=======
      link =  key.css(".xl72, .xl66, .xl74, .xl71").css("a").map {|link| link['href']}
>>>>>>> 67d1de412f04ab18234ba32b871f74a4c547a099
      HikingInfo::Trails.new(name, location, features, miles, elevation_gain, difficulty, link)
    end
  end

end


# this SHOULD return the additional titles that do not have a link with a seperate class. It works on the repl.it scraper
# or key.css(".xl71").css("font").text

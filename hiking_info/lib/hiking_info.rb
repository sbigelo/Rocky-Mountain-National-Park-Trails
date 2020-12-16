require_relative "./hiking_info/version"
require_relative "./hiking_info/cli"
require 'pry'
require_relative "./hiking_info/scraper"
require_relative "./hiking_info/trails"
require "nokogiri"
require "open-uri"

module HikingInfo
  class Error < StandardError; end
  # Your code goes here...
end

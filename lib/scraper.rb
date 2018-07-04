require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    scraped_students = []

    doc.css(".student-card").each do |card|
      student_details = {}
      student_details[:name] = card.css('.student-name').text
      student_details[:location] = card.css('.student-location').text
      student_details[:profile_url] = card.css('.student-card a').text
      scraped_students << student_details
    end
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
  end


end

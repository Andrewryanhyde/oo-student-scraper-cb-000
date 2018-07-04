require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    students = []

    doc.css("div.student-card").each do |card|
      scraped_student = {}
      scraped_student[:name] = card.css('.student-name').text
      scraped_student[:location] = card.css('.student-location').text
      scraped_student[:profile_url] = card.css("a").attribute("href").value
      students << student_details
    end
    scraped_students
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
  end


end

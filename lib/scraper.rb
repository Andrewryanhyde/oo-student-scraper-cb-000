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
      students << scraped_student
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))

    profile = {}

    doc.css("div.social-icon-container a").each do |icon|
      if icon.attribute("href").include?("twitter")
        profile[:twitter] = icon.attribute("href").value
      elsif icon.attribute("href").include?("linkedin")
        profile[:linkedin] = icon.attribute("href").value
      elsif icon.attribute("href").include?("github")
        profile[:github] = icon.attribute("href").value
      else
        profile[:blog] = icon.attribute("href").value
      end
    end
    profile[:profile_quote] = profile.css("div.main-wrapper.profile .vitals-text-container .profile-quote").text
    profile[:bio] = profile.css("div.main-wrapper.profile .description-holder p").text

    profile

  end


end

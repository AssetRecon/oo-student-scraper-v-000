require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    #esponsible for scraping the index page that lists all of the students
    array = []
    doc =  Nokogiri::HTML(open(index_url))
#    binding.pry
    doc.css("div.student-card").each do |card|
    array << {name: card.css("h4.student-name").text,
              location: card.css("p.student-location").text,
              profile_url: card.css("a").attribute("href").value
              }
    end
    array
#     binding.pry
  end

  def self.scrape_profile_page(profile_url)
    #responsible for scraping an individual student's profile page to get further information about that student.
    hash = {}
    doc = Nokogiri::HTML(open(profile_url))
    binding.pry
    doc.css("div.social-icon-container").each do |profile|
        {twitter: profile.css("a").attribute("href").value
  #      linkedin:,
  #      github:,
  #      blog:,
  #      profile_quote:,
  #      bio:
        }
    end
  end


end

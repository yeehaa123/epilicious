require 'open-uri'
require 'nokogiri'

module Epilicious

  class Fetcher
    attr_reader :recipe_urls

    def initialize
      @recipe_urls ||= []
    end

    def fetch_recipes(url = default_url)
      fetch_recipes_index(url)
      recipe_urls << 'test' 
    end
    
    private

    def fetch_recipes_index(url)
      Nokogiri::HTML(open(url))
    end

    def default_url
      "http://www.epicurious.com/articlesguides/bestof/toprecipes/bestburgerrecipes"
    end
  end
end

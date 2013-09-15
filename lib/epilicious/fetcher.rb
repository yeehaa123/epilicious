require 'open-uri'
require 'nokogiri'

module Epilicious

  class Fetcher
    attr_reader :recipe_urls

    def initialize
      @recipe_urls ||= []
    end

    def fetch_recipes
      fetch_recipes_index
      recipe_urls << 'test' 
    end
    
    def fetch_recipes_index

    end
  end
end

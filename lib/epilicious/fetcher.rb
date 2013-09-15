require 'open-uri'
require 'nokogiri'
require 'pry'

module Epilicious

  class Fetcher
    attr_accessor :recipes

    def initialize
      @recipes ||= []
    end

    def fetch_recipes(url = default_url)
      recipes_page = fetch_recipes_page(url)
      recipes_urls = parse_recipes_page(recipes_page)
      self.recipes << Recipe.new("pasta")
    end
    
    private

    def fetch_recipes_page(url)
      Nokogiri::HTML(open(url))
    end

    def parse_recipes_page(page)
      page.css('#artInner .recipe_result_right a').map {|link| link ['href'] }
    end

    def default_url
      "http://www.epicurious.com/articlesguides/bestof/toprecipes/bestburgerrecipes"
    end
  end
end

Recipe = Struct.new(:name)

require 'open-uri'
require 'nokogiri'
require 'pry'

module Epilicious

  class Fetcher
    attr_reader :recipes

    def initialize
      @recipes ||= []
      @base_url = "http://www.epicurious.com"
    end

    def fetch_recipes(url = default_url)
      recipes_page = fetch_page(url)
      recipes_urls = parse_recipes_page(recipes_page)
      @recipes << Recipe.new("pasta")
    end 
    
    private

    def fetch_page(url)
      Nokogiri::HTML(open(url))
    end

    def parse_recipes_page(page)
      page.css('#artInner .recipe_result_right a').map {|link| link ['href'] }
    end

    def default_url
      "#{@base_url}/articlesguides/bestof/toprecipes/bestburgerrecipes"
    end
  end
end

Recipe = Struct.new(:name)

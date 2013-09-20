require 'open-uri'
require 'nokogiri'

require_relative './parser'
require_relative './recipe'

module Epilicious
  class Fetcher
    attr_reader :recipes

    def initialize
      @recipes ||= []
      @base_url = "http://www.epicurious.com"
    end

    def fetch_recipes(index_url)
      recipes_page = fetch_page(index_url)
      recipes_urls = parser.parse_recipes_page(recipes_page)
      recipes = recipes_urls.map do |url|
        fetch_recipe(url)
      end
      recipes
    end 

    def fetch_recipe(url)
      recipe_page = fetch_page(url)
      recipe = parser.parse_recipe_page(recipe_page)
      Recipe.new(recipe)
    end
    
    private

    def fetch_page(url)
      if url =~ /http\:\/\/.*\//
        Nokogiri::HTML(open(url))
      else
        Nokogiri::HTML(open(@base_url + url))
      end
    end

    def parser
      @parser ||= Parser.new
    end
  end
end



class Recipe
  def initialize(args)
    @name = args[:name]
  end
end

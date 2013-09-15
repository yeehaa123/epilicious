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

    def fetch_recipes(url = default_index_url)
      recipes_page = fetch_page(url)
      recipes_urls = parse_recipes_page(recipes_page)
      @recipes << Recipe.new(name: "pasta")
    end 

    def fetch_recipe(url = default_recipe_url)
      recipe_page = fetch_page(url)
      recipe = parse_recipe_page(recipe_page)
      Recipe.new(recipe)
    end
    
    private

    def fetch_page(url)
      Nokogiri::HTML(open(@base_url + url))
    end

    def parse_recipes_page(page)
      page.css('#artInner .recipe_result_right a').map {|link| link ['href'] }
    end

    def parse_recipe_page(page)
      recipe = {}
      recipe[:name] = page.css("div#headline h1").text 
      recipe
    end

    def default_index_url
      "/articlesguides/bestof/toprecipes/bestburgerrecipes"
    end

    def default_recipe_url
      "/articlesguides/bestof/toprecipes/bestburgerrecipes/recipes/food/views/Grilled-Turkey-Burgers-with-Cheddar-and-Smoky-Aioli-354289"
    end
  end
end

class Recipe
  def initialize(args)
    @name = args[:name]
  end
end

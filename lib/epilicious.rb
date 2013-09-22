require "epilicious/version"
require "epilicious/fetcher"
require "epilicious/cookbook"

module Epilicious
  def self.recipes(url = recipes_url)
    Cookbook.recipes(url)
  end
end

def recipes_url
  "http://www.epicurious.com/recipesmenus/whatsnew/recipes"
end

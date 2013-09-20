require "epilicious/version"
require "epilicious/fetcher"

module Epilicious
  def self.recipes(url = recipes_url)
    Fetcher.new.fetch_recipes(url)
  end
end

def recipes_url
  "http://www.epicurious.com/recipesmenus/whatsnew/recipes"
end

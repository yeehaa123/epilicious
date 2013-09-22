require "epilicious/version"
require "epilicious/fetcher"
require "epilicious/cookbook"

module Epilicious
  def self.recipes(url = recipes_url)
    CookBook.recipes(url)
  end

  def self.recipes_url
    "http://www.epicurious.com/recipesmenus/whatsnew/recipes"
  end
end

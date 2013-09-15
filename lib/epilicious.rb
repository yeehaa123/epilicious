require "epilicious/version"
require "epilicious/fetcher"

module Epilicious
  def self.recipes
    Fetcher.new.fetch_recipes
  end
end

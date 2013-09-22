require 'redis'
require 'json'

require_relative './recipe'

module Epilicious

  class CookBook
    
    def self.redis
      Redis.new
    end

    def self.recipes(url)
      unless recipe_vault = redis.get(url)
        fetched_recipes = fetcher(url)
        self.recipes = {url => fetched_recipes }
        return fetched_recipes
      end

      JSON.parse(recipe_vault).map do |recipe|
        Recipe.new(recipe)
      end
    end

    def self.recipes=(cookbook)
      url = cookbook.keys.first
      cookbook = cookbook[url].to_json
      redis.set(url, cookbook)
    end

    def self.fetcher(url)
      Fetcher.new.fetch_recipes(url)
    end

  end
end
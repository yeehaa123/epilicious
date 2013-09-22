require 'redis'
require 'json'

require_relative './recipe'

module Epilicious
  class CookBook
    
    def self.redis
      Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
    rescue
      Redis.new
    end

    def self.recipes(url)
      unless recipe_vault = redis.get(url)
        fetched_recipes = fetcher(url)
        self.recipes = {url => fetched_recipes }
        return fetched_recipes
      end

      JSON.parse(recipe_vault).map do |recipe|
        recipe.keys.each do |key|
            recipe[(key.to_sym rescue key) || key] = recipe.delete(key)
        end
        Recipe.new(recipe)
      end
    end

    def self.recipes=(cookbook)
      url = cookbook.keys.first
      cookbook = cookbook[url].to_json
      redis.set(url, cookbook)
      redis.expire(url, day)
    end

    def self.fetcher(url)
      Fetcher.new.fetch_recipes(url)
    end

    def self.day
      24 * 60 * 60
    end

    def uri
      URI.parse(ENV["REDISCLOUD_URL"])
    end

  end
end

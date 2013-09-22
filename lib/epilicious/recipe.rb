require 'json'

module Epilicious

  class Recipe
    attr_reader :name, :servings, :ingredients, :instructions
    
    def initialize(args)
      @name         = args[:name]
      @servings     = args[:servings]
      @ingredients  = args[:ingredients]
      @instructions = args[:instructions]
    end

    def to_json(*args)
      { name: name, servings: servings, ingredients: ingredients, instructions: instructions }.to_json(*args)
    end

  end
end

module Epilicious

  class Recipe
    attr_reader :name, :servings, :ingredients, :instructions
    
    def initialize(args)
      @name         = args[:name]
      @servings     = args[:servings]
      @ingredients  = args[:ingredients]
      @instructions = args[:instructions]
    end
  end
end

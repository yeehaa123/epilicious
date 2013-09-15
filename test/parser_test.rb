require 'test_helper'

describe Epilicious::Parser do
  context '#parse_recipes_page' do
    let(:recipes_urls) { parser.send(:parse_recipes_page, recipes_page) }

    it 'should return an array' do
      recipes_urls.must_be_instance_of Array
    end

    it 'should not be empty' do
      recipes_urls.wont_be_empty
    end

    it 'should contain urls' do
      recipes_urls.each do |url|
        url.must_be_instance_of String
      end
    end

    def recipes_page
      url = "/articlesguides/bestof/toprecipes/bestburgerrecipes"
      Epilicious::Fetcher.new.send(:fetch_page, url)
    end
  end

  context '#parse_recipe_page' do
    let(:recipe) { parser.send(:parse_recipe_page, recipe_page) }

    it 'should have a name' do
      recipe[:name].must_equal "Grilled Turkey Burgers with Cheddar and Smoky Aioli"  
    end

    it 'should tell the number of servings' do
      recipe[:servings].must_equal "Makes 4"
    end

    it 'should have a list of ingredients' do
      recipe[:ingredients].length.must_equal 15
      recipe[:ingredients].first.must_equal "1/2 teaspoon cumin seeds"
    end

    it 'should have a list of instructions' do
      recipe[:instructions].length.must_equal 6
    end

    def recipe_page
      url = "/articlesguides/bestof/toprecipes/bestburgerrecipes/recipes/food/views/Grilled-Turkey-Burgers-with-Cheddar-and-Smoky-Aioli-354289"
      Epilicious::Fetcher.new.send(:fetch_page, url)
    end
  end

  def parser
    Epilicious::Parser.new
  end
end

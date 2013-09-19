require 'test_helper'

describe Epilicious::Fetcher do
  let(:fetcher) { Epilicious::Fetcher.new }

  context '#fetch_recipes' do
    let(:recipes) { fetcher.fetch_recipes(recipes_url) }

    it 'should return a list of recipes' do
      recipes.length.must_equal 15
      recipes.last.must_be_instance_of Epilicious::Recipe
    end
  end

  context '#fetch_recipe' do
    let(:recipe) { fetcher.fetch_recipe(recipe_url)}

    it' should return a recipe' do
      recipe.must_be_instance_of Epilicious::Recipe
    end
  end

  context 'private methods' do
    let(:recipes_page) { fetcher.send(:fetch_page, recipes_url) }
                        
    context '#fetch_page' do
      it 'should return a nokogiri document' do
        recipes_page.must_be_instance_of Nokogiri::HTML::Document
      end
    end
  end
end

def recipes_url
  "/articlesguides/bestof/toprecipes/bestburgerrecipes"
end

def recipe_url
  "/articlesguides/bestof/toprecipes/bestburgerrecipes/recipes/food/views/Grilled-Turkey-Burgers-with-Cheddar-and-Smoky-Aioli-354289"
end

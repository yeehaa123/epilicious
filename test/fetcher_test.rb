require 'test_helper'

describe Epilicious::Fetcher do
  let(:fetcher) { Epilicious::Fetcher.new }
  let(:url) { "http://www.epicurious.com/articlesguides/bestof/toprecipes/bestburgerrecipes" }

  context '#fetch_recipes' do
    it 'should return a array' do
      fetcher.fetch_recipes.must_be_instance_of Array
    end

    it 'should not be empty' do
      fetcher.fetch_recipes.wont_be_empty
    end

    it 'should contain recipes' do
      fetcher.fetch_recipes.each do |recipe|
        recipe.must_be_instance_of String
      end
    end

    it 'should call fetch_recipes_index with a default url' do

      fetcher.expects(:fetch_recipes_index).with(url)
      fetcher.fetch_recipes
    end

    it 'should call fetch_recipes_index with a custom url' do
      custom = "http://www.epicurious.com/articlesguides/bestof/toprecipes/bestpastarecipes"

      fetcher.expects(:fetch_recipes_index).with(custom)
      fetcher.fetch_recipes(custom)
    end
  end

  context '#fetch_recipes_index' do
    it 'should return a nokogiri document' do
      fetcher.send(:fetch_recipes_index, url).must_be_instance_of Nokogiri::HTML::Document
    end
  end
end

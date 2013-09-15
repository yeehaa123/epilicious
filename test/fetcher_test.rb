require 'test_helper'

describe Epilicious::Fetcher do
  let(:fetcher) { Epilicious::Fetcher.new }

  context '#fetch_recipes' do
    it 'should return a array' do
      fetcher.fetch_recipes.must_be_instance_of Array
    end

    it 'should not be empty' do
      fetcher.fetch_recipes.wont_be_empty
    end

    it 'should contain urls' do
      fetcher.fetch_recipes.each do |recipe|
        recipe.must_be_instance_of String
      end
    end
  end

  context 'private methods' do
    let(:recipes_page) { fetcher.send(:fetch_recipes_page, url) }
    let(:url) { "http://www.epicurious.com/articlesguides/bestof/toprecipes/bestburgerrecipes" }
                        
    context '#fetch_recipes_page' do
      it 'should return a nokogiri document' do
        recipes_page.must_be_instance_of Nokogiri::HTML::Document
      end
    end
  end
end

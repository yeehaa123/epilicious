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

  context '#parse_recipes_page' do
  end

  def parser
    Epilicious::Parser.new
  end
end

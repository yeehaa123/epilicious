require 'test_helper'

describe Epilicious::Fetcher do
  let(:fetcher) { Epilicious::Fetcher.new.fetch_recipes }

  describe '#fetch_recipes' do
    it 'should return a array' do
      fetcher.must_be_instance_of Array
    end

    it 'should not be empty' do
      fetcher.wont_be_empty
    end

    it 'should contain recipes' do
      fetcher.each do |recipe|
        recipe.must_be_instance_of String
      end
    end

    it "should call fetch_recipes_index" do
      
    end
  end
end

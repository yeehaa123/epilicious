require 'test_helper'

describe Epilicious::Fetcher do
  let(:fetcher) { Epilicious::Fetcher.new }

  describe '#fetch_recipe' do
    it 'should return a hash' do
      fetcher.fetch_recipe.must_be_instance_of OpenStruct
    end
  end
end

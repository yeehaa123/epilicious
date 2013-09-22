require 'test_helper'
require 'pry'

describe Epilicious::CookBook do
  let(:cookbook) { Epilicious::CookBook }
  let(:recipes) { cookbook.recipes("test") }

  context "#recipes" do

    before do
      cookbook.recipes = { "test" => [Epilicious::Recipe.new({})] } 
    end
    
    after do
      cookbook.redis.flushdb
    end

    it "must return a list of recipe objects" do 
      recipes.must_be_instance_of Array
      recipes.first.must_be_instance_of Epilicious::Recipe
      cookbook.redis.ttl("test").must_be :<=, day
      cookbook.redis.ttl("test").must_be :>=, day - 10
    end

    it "must fetch a list recipes when url does not exits" do
      cookbook.expects(:fetcher).with("bla").returns([Epilicious::Recipe.new({})])
      cookbook.recipes("bla").must_be_instance_of Array
      cookbook.recipes("bla").first.must_be_instance_of Epilicious::Recipe
    end
  end
  
  def day
    24 * 60 * 60
  end
end

require 'test_helper'
require 'pry'
describe Epilicious::Recipe do
  let(:recipe) { Epilicious::Recipe.new({name: "test", servings: "4", ingredients: ["many"], instructions: ["more"]}) }
  it "should have the right attributes" do
    recipe.name.must_equal "test"
    recipe.servings.must_equal "4"
    recipe.ingredients.must_be_instance_of Array
    recipe.instructions.must_be_instance_of Array
  end

  context "#to_json" do
    it "should return a string" do
      recipe.to_json.must_be_instance_of String
    end
  end
end

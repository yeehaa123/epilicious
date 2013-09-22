require 'test_helper'

describe Epilicious do
  let(:cookbook) { Epilicious::CookBook }

  context ".recipes" do
    it "must call CookBook.recipes with the right url" do
      cookbook.expects(:recipes).with("/test")
      Epilicious.recipes("http://test.com/test")
    end

    it "must call cookbook with the default url" do
      cookbook.expects(:recipes).with("/recipesmenus/whatsnew/recipes")
      Epilicious.recipes
    end
  end
end

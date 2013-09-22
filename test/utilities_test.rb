require 'test_helper'

describe Epilicious::Utilities do
  let(:utilities) { Epilicious::Utilities }

  context ".symbolize_keys" do
    it "should convert string keys into symbols" do
      hash = utilities.symbolize_keys({"one" => nil, "two" => nil})
      hash.keys.must_equal [:one, :two]
    end
  end

  context ".strip url" do
    it "should return a relative url" do
      input_url = "http://www.epicurious.com/test/"
      output_url = utilities.strip_url(input_url)
      output_url.must_match(/\A\/.+/)
    end
  end
end

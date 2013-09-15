require 'minitest/autorun'
require 'mocha/setup'

require_relative '../lib/epilicious'

class MiniTest::Spec
  class << self
    alias :context :describe
  end
end

require "bundler"
Bundler.setup
require "minitest/autorun"
require "minitest/hooks/test"

module MissingMethods
  def before(_type = nil, &block)
    define_method :setup do
      super()
      self.instance_eval(&block)
    end
  end

  def after(_type = nil, &block)
    define_method :teardown do
      self.instance_eval(&block)
      super()
    end
  end
end

class TestMeme < Minitest::Test
  extend MissingMethods
  include Minitest::Hooks

  before(:all) do
    puts "before all!"
  end

  before(:each) do
    puts "before each!"
  end

  def test_equality
    assert_equal 1, 1
  end

  def test_equality_again
    assert_equal 1, 1
  end
end
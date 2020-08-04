require "./test/test_helper"

class CuratorTest < Minitest::Test

  def test_it_exists
    curator = Curator.new
    assert_instance_of Curator, curator
  end

  def test_has_attributes
    curator = Curator.new
    
    assert_equal = [], curator.photographs
  end
end
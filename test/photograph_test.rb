require "./test/test_helper"

class PhotographTest < Minitest::Test

  def test_it_exists
    photograph = Photograph.new
    assert_instance_of Photograph, photograph
  end
end
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

class RoomTest < Minitest::Test

  def setup
    @room = Room.new(:bedroom, 10, 13)
  end
  def test_it_exists
    assert_instance_of Room, @room
  end
  def test_it_initializes
    assert_equal :bedroom, @room.category
    assert_equal 10, @room.length
    assert_equal 13, @room.width
  end
  def test_it_has_an_area
    assert_equal 130, @room.area
    @room = Room.new(:bedroom, 10, 0)
    assert_equal "Please use a number greater than 0", @room.area
  end
end 

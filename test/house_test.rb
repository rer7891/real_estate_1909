require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @room_3 = Room.new(:living_room, 25, 15)
    @room_4 = Room.new(:basement, 30, 41)
  end
  def test_it_exists
    assert_instance_of House, @house
  end
  def test_it_initializes
    assert_equal "$400000", @house.price
    assert_equal "123 sugar lane", @house.address
  end
  def test_rooms_start_empty
    assert_equal [], @house.rooms
  end
  def test_it_can_add_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal [@room_1, @room_2], @house.rooms
  end
  def test_it_can_sort_rooms_by_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2] , @house.rooms_from_category(:bedroom)
    assert_equal [], @house.rooms_from_category(:attic)
  end
  def test_it_has_a_total_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area
  end
  def test_it_can_sort_rooms_by_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2, @room_3, @room_4], @house.rooms_sorted_by_area
    refute_equal [@room_2, @room_1, @room_3, @room_4], @house.rooms_sorted_by_area
  end
  def test_rooms_can_sort_by_category
    rooms_by_category = {:bedroom=>[@room_1, @room_2], :living_room=>[@room_3], :basement=>[@room_4]}
    wrong_rooms = {:bedroom=>[@room_1], :living_room=>[@room_2, @room_3], :basement=>[@room_4]}
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal rooms_by_category, @house.rooms_by_category
    refute_equal wrong_rooms, @house.rooms_by_category
  end
end

class House
  attr_reader :price, :address, :rooms
  attr_accessor :sum
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end
  def add_room(room)
    @rooms << room
    @rooms
  end
  def rooms_from_category(category)
    @rooms.find_all { |room| room.category == category}
  end
  def area
    @sum = 0
    @rooms.each {|room| @sum += room.area}
    @sum
  end
  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
    end
  end
  def rooms_by_category
    @rooms.group_by {|room| room.category}
  end
end

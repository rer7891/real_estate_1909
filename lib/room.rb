class Room
  attr_reader :category, :length, :width, :room_area
  def initialize(category, length, width)
    @category = category
    @width = width
    @length = length
  end
  def area
    if @width == 0 || @length == 0
      return "Please use a number greater than 0"
    else
      @room_area = @width * @length
    end
  end
end

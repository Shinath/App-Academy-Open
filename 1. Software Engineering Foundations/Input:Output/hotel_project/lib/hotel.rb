require_relative 'room'

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = {}
    rooms.each_pair do |room, capacity|
      @rooms[room] = Room.new(capacity)
    end
  end

  def name
    @name.split.map(&:capitalize).join(' ')
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    @rooms.include?(room)
  end

  def check_in(person, room)
    if room_exists?(room)
      if @rooms[room].add_occupant(person)
        print "check in successful\n"
      else
        print "sorry, room is full\n"
      end
    else
      print "sorry, room does not exist\n"
    end
  end

  def has_vacancy?
    @rooms.each_value do |room|
      return true unless room.full?
    end
    false
  end

  def list_rooms
    @rooms.each_key { |name| puts "#{name}*#{@rooms[name].available_space}" }
  end
end

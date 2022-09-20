require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each { |k, v| @rooms[k] = Room.new(v) }
    end

    def name
        capitalized = []
        @name.split.each_with_index { |word, i| capitalized << word.capitalize }
        capitalized.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person_name, room_name)
        if !self.room_exists?(room_name)
            puts "sorry, room does not exist"
        else 
            success = @rooms[room_name].add_occupant(person_name)
        end

        if success
            puts "check in successful"
        else
            puts "sorry, room is full"
        end
    end

    def has_vacancy?
        @rooms.each_value do |room|
            if !room.full?
                return true
            end
        end
        false
    end

    def list_rooms
        @rooms.each do |k, v|
            puts k +" (" + v.available_space.to_s + ")"
        end
    end
end

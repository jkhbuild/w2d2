class Room
    attr_accessor :capacity, :occupants
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        return false if @capacity > @occupants.length
        true
    end

    def available_space
        space_available = @capacity - @occupants.length
        space_available
    end

    def add_occupant(name)
        if !(self.full?)
            @occupants << name
            return true
        end
        false
    end

  
end
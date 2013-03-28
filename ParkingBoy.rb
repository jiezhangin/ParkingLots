class ParkingBoy
	def initialize(*parkingLots)
		@parkingLots = parkingLots
		
	end
	
	
	def has_empty
		 @parkingLots.each do |parkingLot|
			if parkingLot.has_empty?
				return true
			end
		end
		return false
	end
	
	def park(carID)
		lot = @parkingLots.select{|lot|lot.has_empty?}.first
		raise NoParkingLotsException.new("Sorry, no parking lot avaialbe!") if lot.nil?
		lot.park(carID)
	end
	
	def pick(ticket)
		@parkingLots.each do |parkingLot|
			car = parkingLot.pick(ticket)
			if car
				return car
			end
		end
		return nil
	end
end
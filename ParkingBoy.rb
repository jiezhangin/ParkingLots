class ParkingBoy
	def initialize(*parkingLotsList)
		@numOfParkingLots = parkingLotsList.length
		@parkingLotsList = parkingLotsList
		
	end
	
	attr_reader :numOfParkingLots
	
	def has_empty
		 @parkingLotsList.each do |parkingLots|
			if parkingLots.has_empty?
				return true
			end
		end
		return false
	end
	
	def park(carID)
		@parkingLotsList.each do |parkingLots|
			if parkingLots.has_empty?
				return parkingLots.park(carID)
			end
		end
		raise NoParkingLotsException.new("Sorry, no parking lot avaialbe!")
	end
	
	def pick(ticket)
		@parkingLotsList.each do |parkingLots|
			car = parkingLots.pick(ticket)
			if car
				return car
			end
		end
		return nil
	end
end
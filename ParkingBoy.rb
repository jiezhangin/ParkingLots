class ParkingBoy
	def initialize(numOfParkingLots)
		@numOfParkingLots = numOfParkingLots
		
	end
	
	attr_reader :numOfParkingLots
	
	def has_empty
		if @numOfParkingLots > 0
			return true
		end
		return false
	end
end
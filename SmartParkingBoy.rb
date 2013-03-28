require '../ParkingLot' 
require '../ParkingBoy'
require '../Ticket'
require '../NoParkingLotsException'

class SmartParkingBoy < ParkingBoy
	
	def park(carID)
		@parkingLots.max{ |lhs, rhs| lhs.availalbe_lots_count <=> rhs.availalbe_lots_count }
			.park(carID)
	end
	
end
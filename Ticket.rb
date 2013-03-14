class Ticket
	def initialize(parkLotID, carID)
		puts "new ticket"
		@parkingLotID = parkLotID
		@id = carID
	end
	
	attr_reader :parkingLotID
	attr_reader :id
end
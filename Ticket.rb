class Ticket
	def initialize(parkLotID)
		puts "new ticket"
		@parkingLotID = parkLotID
		
	end
	
	attr_reader :parkingLotID
	
end
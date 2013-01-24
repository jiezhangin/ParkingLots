class ParkingLots
	def initialize(lotsCount)
		puts "In ParkingLots"
		@availalbe_lots_count = lotsCount
	end
	
	attr_reader :availalbe_lots_count
	
	def empty?
		@availalbe_lots_count < 1
	end
end
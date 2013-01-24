require_relative './Ticket'
require_relative './NoParkingLotsException'

class ParkingLots
	def initialize(lotsCount)
		puts "In ParkingLots"
		@availalbe_lots_count = lotsCount
	end
	
	attr_reader :availalbe_lots_count
	
	def empty?
		@availalbe_lots_count < 1
	end
	
	def park(carID)
		raise NoParkingLotsException.new("Sorry, no parking lot avaialbe!") if empty?
			@availalbe_lots_count = @availalbe_lots_count - 1
			Ticket.new(availalbe_lots_count, carID)
	end
end


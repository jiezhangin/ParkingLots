require_relative './Ticket'
require_relative './NoParkingLotsException'

class ParkingLot
	def initialize(lotsCount)
		puts "In ParkingLot"
		@availalbe_lots_count = lotsCount
		@cars = {}
	end
	
	attr_reader :availalbe_lots_count
	
	def has_empty?
		@availalbe_lots_count > 0
	end
	
	def park(carID)
		raise NoParkingLotsException.new("Sorry, no parking lot avaialbe!") if !has_empty?
		@availalbe_lots_count = @availalbe_lots_count - 1
		ticket = Ticket.new(availalbe_lots_count)
		@cars[ticket] = carID
		return ticket
	end
	
	def pick(ticket)
		@cars[ticket]
	end
end


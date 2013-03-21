require '../ParkingLots' 
require '../ParkingBoy'
require '../Ticket'
require '../NoParkingLotsException'
require 'minitest/autorun'

class ParkingBoyTest < MiniTest::Unit::TestCase

	def setup     #Test initialize
		@parkingBoyWithTwoSpaces = ParkingBoy.new(ParkingLots.new(2))
	
	end
	
	def test_should_return_true_when_parking_lots_has_empty_space
		parkingBoy = ParkingBoy.new(ParkingLots.new(2), ParkingLots.new(3));
		assert parkingBoy.has_empty
	end
	
	def test_should_return_false_when_there_is_no_parking_lots
		parkingBoy = ParkingBoy.new();
		assert !parkingBoy.has_empty
	end
		
	def test_should_return_false_when_parking_lots_are_full
		parkingLots = ParkingLots.new(1)
		parkingLots.park("car1")
		parkingBoy = ParkingBoy.new(parkingLots);
		
		assert !parkingBoy.has_empty
	end
		
	def test_should_park_car_and_return_ticket_when_there_are_empty_spaces
		ticket = @parkingBoyWithTwoSpaces.park("car1")
		assert ticket
	end
	
	def test_should_pick_one_car_with_valid_ticket
		parkedCarID = "car1"
		ticket = @parkingBoyWithTwoSpaces.park(parkedCarID)
		
		carID = @parkingBoyWithTwoSpaces.pick(ticket)
		
		assert_equal parkedCarID, carID
	end
		
	def test_should_pick_two_cars_with_valid_ticket
		parkedCarID1 = "car1"
		parkedCarID2 = "car2"
		ticket1 = @parkingBoyWithTwoSpaces.park(parkedCarID1)
		ticket2 = @parkingBoyWithTwoSpaces.park(parkedCarID2)
		
		carID1 = @parkingBoyWithTwoSpaces.pick(ticket1)
		assert_equal parkedCarID1, carID1
		
		carID2 = @parkingBoyWithTwoSpaces.pick(ticket2)
		assert_equal parkedCarID2, carID2
	end
		
	def test_should_throw_exception_when_parking_car_and_no_empty_spaces
		@parkingBoyWithTwoSpaces.park("car1")
		@parkingBoyWithTwoSpaces.park("car2")
		
		assert_raises(NoParkingLotsException) do
			@parkingBoyWithTwoSpaces.park("car3")
		end
	end	
		
	def test_should_return_nil_when_picking_car_with_invalid_ticket
		invalidTicket = Ticket.new("invalid")
		
		carID = @parkingBoyWithTwoSpaces.pick(invalidTicket)
		
		assert_nil carID
	end
end
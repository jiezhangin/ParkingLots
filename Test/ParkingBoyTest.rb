require '../ParkingLot' 
require '../ParkingBoy'
require '../Ticket'
require '../NoParkingLotsException'
require 'minitest/autorun'

class ParkingBoyTest < MiniTest::Unit::TestCase

	def setup     #Test initialize
		@parkingBoyWithTwoSpaces = ParkingBoy.new(ParkingLot.new(2))
		@parkedCarID1 = "car1"
		@parkedCarID2 = "car2"
	end
	
	def test_should_return_true_when_parking_lots_has_empty_space
		parkingBoy = ParkingBoy.new(ParkingLot.new(2), ParkingLot.new(3));
		assert parkingBoy.has_empty
	end
	
	def test_should_return_false_when_there_is_no_parking_lots
		parkingBoy = ParkingBoy.new();
		assert !parkingBoy.has_empty
	end
		
	def test_should_return_false_when_parking_lots_are_full
		parkingLot = ParkingLot.new(1)
		parkingLot.park(@parkedCarID1)
		parkingBoy = ParkingBoy.new(parkingLot);
		
		assert !parkingBoy.has_empty
	end
		
	def test_should_park_car_and_return_ticket_when_there_are_empty_spaces 
		ticket = @parkingBoyWithTwoSpaces.park(@parkedCarID1)
		assert ticket
	end
	
	def test_should_pick_one_car_with_valid_ticket
		ticket = @parkingBoyWithTwoSpaces.park(@parkedCarID1)
		
		carID = @parkingBoyWithTwoSpaces.pick(ticket)
		
		assert_equal @parkedCarID1, carID
	end
		
	def test_should_pick_two_cars_with_valid_ticket
		ticket1 = @parkingBoyWithTwoSpaces.park(@parkedCarID1)
		ticket2 = @parkingBoyWithTwoSpaces.park(@parkedCarID2)
		
		carID1 = @parkingBoyWithTwoSpaces.pick(ticket1)
		assert_equal @parkedCarID1, carID1
		
		carID2 = @parkingBoyWithTwoSpaces.pick(ticket2)
		assert_equal @parkedCarID2, carID2
	end
		
	def test_should_throw_exception_when_parking_car_and_no_empty_spaces
		@parkingBoyWithTwoSpaces.park(@parkedCarID1)
		@parkingBoyWithTwoSpaces.park(@parkedCarID2)
		
		assert_raises(NoParkingLotsException) do
			@parkingBoyWithTwoSpaces.park("CarHasNoSpace")
		end
	end	
		
	def test_should_return_nil_when_picking_car_with_invalid_ticket
		invalidTicket = Ticket.new("invalid")
		
		carID = @parkingBoyWithTwoSpaces.pick(invalidTicket)
		
		assert_nil carID
	end
end
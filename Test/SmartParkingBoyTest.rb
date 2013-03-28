require '../ParkingLot' 
require '../SmartParkingBoy'
require '../Ticket'
require '../NoParkingLotsException'
require 'minitest/autorun'


class SmartParkingBoyTest < MiniTest::Unit::TestCase

	def setup
		@parkingLotWithTwoSpaces = ParkingLot.new(2);
		@parkingLotWithThreeSpaces = ParkingLot.new(3);
		@parkingLotWithFourSpaces = ParkingLot.new(4);
		@smartParkingBoy = SmartParkingBoy.new(@parkingLotWithTwoSpaces, @parkingLotWithThreeSpaces, @parkingLotWithFourSpaces);
		
		@parkedCarID1 = "car1"
		@parkedCarID2 = "car2"
	end
	
	def test_should_parking_in_the_parkinglot_with_most_spaces
		ticket = @smartParkingBoy.park(@parkedCarID1)
		
		assert_equal 3, @parkingLotWithFourSpaces.availalbe_lots_count
	end
	
	def test_should_return_true_when_parking_lots_has_empty_space
		assert @smartParkingBoy.has_empty
	end
	
	def test_should_return_false_when_there_is_no_parking_lots
		parkingBoy = SmartParkingBoy.new();
		assert !parkingBoy.has_empty
	end
		
	def test_should_return_false_when_parking_lots_are_full
		parkingLot = ParkingLot.new(1)
		parkingLot.park(@parkedCarID1)
		parkingBoy = SmartParkingBoy.new(parkingLot);
		
		assert !parkingBoy.has_empty
	end
		
	def test_should_park_car_and_return_ticket_when_there_are_empty_spaces 
		ticket = @smartParkingBoy.park(@parkedCarID1)
		assert ticket
	end
	
	def test_should_pick_one_car_with_valid_ticket
		ticket = @smartParkingBoy.park(@parkedCarID1)
		
		carID = @smartParkingBoy.pick(ticket)
		
		assert_equal @parkedCarID1, carID
	end
		
	def test_should_pick_two_cars_with_valid_ticket
		ticket1 = @smartParkingBoy.park(@parkedCarID1)
		ticket2 = @smartParkingBoy.park(@parkedCarID2)
		
		carID1 = @smartParkingBoy.pick(ticket1)
		assert_equal @parkedCarID1, carID1
		
		carID2 = @smartParkingBoy.pick(ticket2)
		assert_equal @parkedCarID2, carID2
	end
		
	def test_should_throw_exception_when_parking_car_and_no_empty_spaces
		(1..9).each do |i|
			cardId = i.to_s
			@smartParkingBoy.park(cardId)
		end
		
		assert_raises(NoParkingLotsException) do
			@smartParkingBoy.park("CarHasNoSpace")
		end
	end	
		
	def test_should_return_nil_when_picking_car_with_invalid_ticket
		invalidTicket = Ticket.new("invalid")
		
		carID = @smartParkingBoy.pick(invalidTicket)
		
		assert_nil carID
	end

end
require '../ParkingLots' 
require '../ParkingBoy'
require '../Ticket'
require '../NoParkingLotsException'
require 'minitest/autorun'

class ParkingBoyTest < MiniTest::Unit::TestCase

	def setup     #Test initialize
		
	end
	
	def test_should_return_true_when_parking_lots_has_empty_space
		parkingLotsList = [ParkingLots.new(2), ParkingLots.new(3)]
		@parkingBoy = ParkingBoy.new(parkingLotsList);
		assert @parkingBoy.has_empty
	end
	
	def test_should_return_false_when_there_is_no_parking_lots
		@parkingBoy = ParkingBoy.new([]);
		assert !@parkingBoy.has_empty
	end
		
	def test_should_return_false_when_parking_lots_are_full
		parkingLots = ParkingLots.new(1)
		parkingLots.park("car1")
		@parkingBoy = ParkingBoy.new([parkingLots]);
		
		assert !@parkingBoy.has_empty
	end
		
	def test_should_park_car_and_return_ticket_when_there_are_empty_spaces
		parkingLots = ParkingLots.new(1)
		@parkingBoy = ParkingBoy.new([parkingLots])
		ticket = @parkingBoy.park("car1")
		assert ticket
	end
	
	def test_should_pick_one_car_with_valid_ticket
		parkingLots = ParkingLots.new(1)
		parkedCarID = "car1"
		@parkingBoy = ParkingBoy.new([parkingLots])
		ticket = @parkingBoy.park(parkedCarID)
		
		carID = @parkingBoy.pick(ticket)
		
		assert_equal parkedCarID, carID
	end
		
	def test_should_pick_two_cars_with_valid_ticket
		parkingLots = ParkingLots.new(2)
		parkedCarID1 = "car1"
		parkedCarID2 = "car2"
		@parkingBoy = ParkingBoy.new([parkingLots])
		ticket1 = @parkingBoy.park(parkedCarID1)
		ticket2 = @parkingBoy.park(parkedCarID2)
		
		carID1 = @parkingBoy.pick(ticket1)
		assert_equal parkedCarID1, carID1
		
		carID2 = @parkingBoy.pick(ticket2)
		assert_equal parkedCarID2, carID2
	end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#parkingLots = parkingBoy.parkingLots
		#parkingLots.each do |lot|
		#	lot.park
		#assert !@parkingBoy.has_empty
end
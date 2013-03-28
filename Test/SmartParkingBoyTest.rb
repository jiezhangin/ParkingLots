require '../ParkingLot' 
require '../SmartParkingBoy'
require '../Ticket'
require '../NoParkingLotsException'
require 'minitest/autorun'


class SmartParkingBoyTest < MiniTest::Unit::TestCase

	def setup     #Test initialize
	end
	
	def test_should_parking_in_the_parkinglot_with_most_spaces
		parkingLotWithTwoSpaces = ParkingLot.new(2);
		parkingLotWithThreeSpaces = ParkingLot.new(3);
		parkingBoy = SmartParkingBoy.new(parkingLotWithTwoSpaces, parkingLotWithThreeSpaces);
		
		ticket = parkingBoy.park("car1")
		
		assert_equal 2, parkingLotWithThreeSpaces.availalbe_lots_count
	end

end
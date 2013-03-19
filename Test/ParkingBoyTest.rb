require '../ParkingLots' 
require '../ParkingBoy'
require '../Ticket'
require '../NoParkingLotsException'
require 'minitest/autorun'

class ParkingBoyTest < MiniTest::Unit::TestCase

	def setup     #Test initialize
		
	end
	
	def test_should_return_true_when_parking_lots_has_empty_space
		@parkingBoy = ParkingBoy.new(2);
		assert @parkingBoy.has_empty
	end
	
	def test_should_return_false_when_parking_lots_are_full
		@parkingBoy = ParkingBoy.new(0);
		assert !@parkingBoy.has_empty
	end
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#parkingLots = parkingBoy.parkingLots
		#parkingLots.each do |lot|
		#	lot.park
		#assert !@parkingBoy.has_empty
end
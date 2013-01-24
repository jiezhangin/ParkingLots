require '../ParkingLots' 
require '../Ticket'
require '../NoParkingLotsException'
require 'minitest/autorun'

class ParkingLotsTest < MiniTest::Unit::TestCase

	def setup     #Test initialize
		@plots = ParkingLots.new(1)
	end


	def test_is_not_empty
		assert !@plots.empty?
	end
	
	def test_is_empty
		@plots.park("car1")
		assert @plots.empty?
	end
	
	def test_can_park_when_parking_lots_available
		parkingTicket = @plots.park("car1")
		assert !parkingTicket.nil?
		assert_equal "car1", parkingTicket.id
	end
	
	
	def test_fail_park_when_no_parking_lots_available
		@plots.park("car1")
		assert_raises(NoParkingLotsException) do
			@plots.park("car2")
		end
	end
end
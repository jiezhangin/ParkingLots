require '../ParkingLots' 
require 'minitest/autorun'

class ParkingLotsTest < MiniTest::Unit::TestCase

	def setup     #Test initialize
		@plots = ParkingLots.new(1)
	end


	def test_is_not_empty
		assert !@plots.empty?
	end
	
end
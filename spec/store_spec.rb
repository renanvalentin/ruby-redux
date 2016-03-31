require 'minitest/autorun'
require_relative '../lib/store'

describe Store do
    before do
        @reducer = lambda {|state = 0|  state * state }
        @store = Store.new(@reducer, 0)
    end

    it "should throw an exception to initialize if reducer is nil" do
        assert_raises("reducer cannot be nil") {
            @store = Store.new
        }
    end

    it "should return the current state" do
       @store.get_state.must_equal "OHAI!" 
    end

    it "should change store's state after calling dispatch" do
        @store.dispatch
        #state = @store.get_state
        #state.must_equal @reducer.call
    end
end
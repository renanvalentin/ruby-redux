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
       @store.get_state.must_equal 0 
    end

    it "should change store's state after calling dispatch" do
        initial_state = 2
        @store = Store.new(@reducer, initial_state)
        @store.dispatch
        state = @store.get_state
        state.must_equal @reducer.call(initial_state)
    end

    it "should call listeners after calling dispatch" do
        count = 0
        @store.subscribe(lambda { count = 1})
        @store.dispatch
        count.must_equal 1
    end

    it "should unsubscribe from the stores subscription" do
        count = 0
        
        unsubscribe = @store.subscribe(lambda { count = count + 1})
       
        @store.dispatch
        count.must_equal 1

        unsubscribe.call()
       
        @store.dispatch
        count.must_equal 1
    end
end

class Store
    def initialize(reducer, initial_state = nil)
        raise "reducer cannot be nil" if reducer.nil? 
        @reducer = reducer 

        @state = initial_state unless initial_state.nil?
    end
    
    def get_state
        @state
    end

    def dispatch
        @state =  @reducer.call(@state)
    end
end

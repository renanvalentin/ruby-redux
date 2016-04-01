class Store
    def initialize(reducer, initial_state = nil)
        raise "reducer cannot be nil" if reducer.nil? 
        @reducer = reducer 

        @state = initial_state unless initial_state.nil?
        @listeners = []
    end
    
    def get_state
        @state
    end

    def dispatch
        @state =  @reducer.call(@state)
        @listeners.each {|listener| listener.call()}
    end

    def subscribe(listener)
        @listeners << listener
        
        lambda do
            @listeners = @listeners.select {|l| l != listener}    
        end
    end
end

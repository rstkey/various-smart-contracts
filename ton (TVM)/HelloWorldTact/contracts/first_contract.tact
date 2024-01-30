import "@stdlib/deploy";

message Add { // Defining a message can be received by a receive method.
    amount: Int as uint32; // Defining an amount field with type uint32.
}

contract FirstContract with Deployable { // Defining a contract block with FirstContract name.

    id: Int as uint32; 
    counter: Int as uint32; // An 32 bit Int variable with `counter` identifier.
    
    init(id: Int) { // Just called during the deployment of contract.
        self.id = id; // Adding an ID in deploy time to make contract unique.
        self.counter = 0; // Initing counter var with 0 as value.
    }


    receive("increment"){ // Receveing any `increment` message and process here.
        self.counter = self.counter + 1; // Updating counter var and adding 1 to it.
    }

    receive(msg: Add) {  // Receveing any `Add` message and process here.
        self.counter = self.counter + msg.amount; // Updating counter by adding amount value in Add message to it.
    }

    get fun counter(): Int { // Defining a getter function.
        return self.counter; // Returning current value of counter.
    }

    get fun id(): Int { // Getter for ID variable.
        return self.id; 
    }
}

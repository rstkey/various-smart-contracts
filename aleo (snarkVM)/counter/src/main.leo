// The 'counter' program.
// .aleo network ID used.
program counter.aleo {
  
    // making a map of address to u8.
    mapping counter: address => u8;

    // increase function can be called from ouside since it's a transition function.
    transition increase(num: u8) {
        // calling the finalize function of increase, to update the map.
        return then finalize(self.caller, num);
    }

    // only finalize functions can update this map values and they are only callable from transition functions. 
    finalize increase(public addr: address, public num: u8) {
        // getting the value of address or use 0 if there is no record for this address.
        let current: u8 = Mapping::get_or_use(counter, addr, 0u8);

        // updating the value with provided number.
        Mapping::set(counter, addr, num);
    }
}

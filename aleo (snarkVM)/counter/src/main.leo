// The 'counter' program.
program counter.aleo {
    mapping counter: address => u8;

    transition increase(num: u8) {
        return then finalize(self.caller, num);
    }

    finalize increase(public addr: address, public num: u8) {
        let current: u8 = Mapping::get_or_use(counter, addr, 0u8);
        Mapping::set(counter, addr, num);
    }
}

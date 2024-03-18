program state.aleo {
    mapping state: address => bool;

    transition update_state(public addr: address, status: bool) {
        return then finalize(addr, status);
    }

    finalize update_state(public addr: address, status: bool) {
        Mapping::set(state, addr, status);
    }
}

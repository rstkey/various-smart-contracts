import state.leo;

program proxy_contract_v1.aleo {
    transition update(public addr: u32, status: u32) {
        state.leo/state_main(addr, status);
    }
}

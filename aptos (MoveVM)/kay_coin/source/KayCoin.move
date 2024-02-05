module KayCoin::kay_coin {
    use aptos_framework::coin;

    struct KayCoin {}

    fun init_module(sender: &signer) {
        aptos_framework::managed_coin::initialize<KayCoin>(
            sender,
            b"Kay Coin",
            b"KCC",
            6,
            false,
        );
    }

    public entry fun register(account: &signer) {
        aptos_framework::managed_coin::register<KayCoin>(account)
    }

    public entry fun mint(account: &signer, dst_addr: address, amount: u64) {
        aptos_framework::managed_coin::mint<KayCoin>(account, dst_addr, amount);
    }

    public entry fun burn(account: &signer, amount: u64) {
        aptos_framework::managed_coin::burn<KayCoin>(account, amount);
    }

    public entry fun transfer(from: &signer, to: address, amount: u64,) {
        coin::transfer<KayCoin>(from, to, amount);
    }
}

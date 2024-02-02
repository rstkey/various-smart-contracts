import "@stdlib/deploy";
import "./messages";
import "./ketton_wallet";

struct Metadata{
    symbol: String;
    totalSupply: Int;
}

contract KetTon with Deployable {

    // The symbol and total supply for KTN jetton.
    symbol: String;
    totalSupply: Int as coins;

    init() {
        // Setting the symbol and totalSupply values.
        self.symbol = "KTN";
        self.totalSupply = ton("500");

        // Minting token to owner account.
        self.mint(self.totalSupply, sender());
    }

    fun mint(amount: Int, to: Address) {
        let init: StateInit = initOf KetTonWallet(myAddress(), to);
        send(SendParameters{
            to: contractAddress(init),
            body: InternalAdd{amount: amount, origin: myAddress()}.toCell(),
            value: ton("0.03"),
            mode: SendIgnoreErrors,
            code: init.code,
            data: init.data
        });
    }

    get fun walletAddress(owner: Address): Address {
        let init: StateInit = initOf KetTonWallet(myAddress(), owner);
        return contractAddress(init);
    }

    get fun metadata(): Metadata {
        return Metadata{symbol: self.symbol, totalSupply: self.totalSupply};
    }
}

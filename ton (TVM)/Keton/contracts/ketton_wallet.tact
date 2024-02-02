import "@stdlib/deploy";
import "./messages";

contract KetTonWallet with Deployable {

    parent: Address; // Jetton contract address.
    owner: Address;  
    balance: Int as coins;

    init(parent: Address, owner: Address) {
        self.parent = parent;
        self.owner = owner;
        self.balance = 0;
    }

    // Handle minting and getting Jettons.
    receive(msg: InternalAdd) {
        if(msg.origin == self.parent){
            require(sender() == self.parent, "Parent only");
        } else {
            let init: StateInit = initOf KetTonWallet(self.parent, msg.origin);
            require(sender() == contractAddress(init), "KetTonWallet only");
        }
        self.balance = self.balance + msg.amount;
    }

    // Handle transfer messages.
    receive(msg: Transfer) {

        // Checking if owner is sender and we have enough balance.
        require(sender() == self.owner, "Access denied");
        require(self.balance >= msg.amount, "Insufficient balance");

        // Subtacting amount.
        self.balance = self.balance - msg.amount;
        
        // Sending tokens to receiver with InternalAdd message.
        let init: StateInit = initOf KetTonWallet(self.parent, msg.to);
        send(SendParameters{
            to: contractAddress(init),
            body: InternalAdd{amount: msg.amount, origin: self.owner}.toCell(),
            value: ton("0.03"),
            mode: SendIgnoreErrors,
            code: init.code,
            data: init.data
        });
        self.reply("transferred".asComment());
    }
}

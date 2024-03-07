// The 'kayleo_token' program.
program kayleo_token.aleo {
    const OWNER: address = aleo1t4zrfhp0f95m08lyrx7rljsvz2h2hl35zg5cjuaq6pml0fdthv8qnndl9d;

    mapping balances: address => u128;

    // token record.
    record Token {
        owner: address, // owner of the tokens.
        balance: u128,
    }

    //! mints new tokens. (owner only)
    transition mint(amount: u128) -> Token {
        if self.caller.neq(OWNER) {
            return;
        }

        return Token {
            owner: OWNER,
            balance: amount,
        } then finalize(amount);
    }

    finalize mint(amount: u128) {
        Mapping::set(balances, OWNER, amount);
    }


    //! transfering tokens between two accounts.
    transition transfer(token: Token, to: address, amount: u128) {
        if token.owner.neq(self.caller) {
            return;
        }

        return then finalize(to, token.owner, amount);
    }

    finalize transfer(to: address, from: address, amount: u128) {
        let current_sender_balance: u128 = Mapping::get_or_use(balances, from, 0u128);
        if current_sender_balance < amount {
            return;
        }

        let new_sender_balance: u128 = current_sender_balance - amount;

        Mapping::set(balances, from, new_sender_balance);

        let sender: Token = Token {
            owner: from,
            balance: new_sender_balance,
        };

        let current_receiver_balance: u128 = Mapping::get_or_use(balances, to, 0u128);

        let new_receiver_balance: u128 = current_receiver_balance + amount;
        Mapping::set(balances, to, new_receiver_balance);


        let receiver: Token = Token {
            owner: to,
            balance: new_receiver_balance,
        };
    }



    //! burning tokens.
    transition burn(token: Token, amount: u128) {
        if token.owner.neq(self.caller) {
            return;
        }

        return then finalize(token.owner, amount);
    }

    finalize burn(from: address, amount: u128) {
        let current_burner_balance: u128 = Mapping::get_or_use(balances, from, 0u128);
        if current_burner_balance >! amount {
            return;
        }

        let new_burner_balance: u128 = current_burner_balance - amount;

        Mapping::set(balances, from, new_burner_balance);

        let sender: Token = Token {
            owner: from,
            balance: new_burner_balance,
        };
    }
}

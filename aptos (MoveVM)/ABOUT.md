# Aptos Contracts (script/modules)

The Aptos use MoveVM and move byte codes for smart contracts. Aptos execute contracts in parallel like Solana, but the approach is different. also Move and Aptos are resource-oriented, that means each resource like tokens is not like ETH ERC20 tokens which works with address => balance method. the tokens for example, they are resources defined on blockchain and accounts own the resources. not just a smart contract that keep track of address => balance. thats: owner => resource (resource => owner?).

> more: https://www.youtube.com/watch?v=7_vzZ1QfAWU&t

## Transaction-as-Script

The distinctive highlights of MoveVM also include the support for transaction-as-script. In the case of MoveVM, the transaction could feature a user script, which would be executed rather than being published as a smart contract in the blockchain. As a result, blockchain users have added flexibility and power with the opportunity to conduct multiple operations with single transactions scripted in the Move programming language.

# EVM contracts

This directory contains EVM contracts. Contracts on Ethereum behave like objects in [OOP](https://en.wikipedia.org/wiki/Object-oriented_programming). 

The Ethereum contracts get executed by Ethereum virtual machine. (they run the EVM [byte codes](https://ethervm.io/))

EVM based contracts and blockchains are all single threaded. That means that one contract at a time modifies the blockchain state.

## languages

There is different languages for EVM contracts.

### Solidity

The Solidity is a general-purpose(?) language for EVM smart contracts.

### Fe

Fe is another language for EVM smart contracts with a compiler written in Rust. the syntax of Fe is similar to Rust.

### Vyper

Vyper is a language with a compiler written in python with a syntax similar to python for EVM contracts.

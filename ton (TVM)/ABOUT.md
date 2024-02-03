# TON contracts

This directory contains TON Blockchain and TVM smart contracts. contracts on TON behave like `actors` and we call it actors too. everything on TON is contract or actor even accounts (they are waller contracts).

## languages

There is 3 different smart contract language for TVM.

### Fift

The Fift is so close to machine code and it's  TVM byte codes. they are not useful for large projects.

### FunC

The FunC is another language for TVM contracts that's have a similar syntax to C. it's not useful for large projects too but it useful to write wallet, multi-sig wallets contracts.

### Tact

The Tact is a language similar with TypeScript fot TVM contracts which is compiled to FunC and then byte codes at the end. Tact is more useful for large projects such as market-places and ...

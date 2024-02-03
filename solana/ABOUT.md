# Solana program

This directory contains Solana programs written in Rust and C using `solana_program`, anchor and ...


## Programs on the Solana

The Solana use Sealevel runtime to execute SBF or solana bytecode format (programs get compiled into SBF). also they are upgradable from contract owner account. this programs have 2 types: on chains and natives.

### on chains

on chain contracts are deployed by any developer and behave like normal contracts on any chain.

### natives

Native contracts are written directly on core implementation and can get upgraded with changing the core.

> more info: https://solana.com/docs/core/programs

## Sealevel run-time (called `svm` also on [solana core](https://github.com/solana-labs/solana/tree/master/runtime/src/svm)(?))

The sealevel is a run-time which execute solana programs, the executable files is on shared object or SO format (program.so).
It's able to run transactions to executable accounts in parallel.


> more info: https://medium.com/solana-labs/sealevel-parallel-processing-thousands-of-smart-contracts-d814b378192


> archived repo: https://github.com/solana-labs/sealevel (empty)

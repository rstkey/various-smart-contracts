// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract KeyValueStore {
    mapping(string => string) public store;

    function set(string memory _Key, string memory _Value) public {
        store[_Key] = _Value;
    }

    function name() public pure returns (string memory) {
        return "key, value store";
    }

    function lookup(string memory _Key) public view returns (string memory) {
        return store[_Key];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {KeyValueStore} from "keyval_store/KeyValueStore.sol";

contract StoreFactory {
    mapping(string => KeyValueStore) public keyValStores;

    function makeKeyValueStore(string memory _Name) public {
        KeyValueStore newKeyValStore = new KeyValueStore();
        keyValStores[_Name] = newKeyValStore;
    }

    function setTo(
        string memory _Name,
        string memory _Key,
        string memory _Value
    ) public {
        KeyValueStore kvStore = keyValStores[_Name]; // another way is storing and finding stores by address(?).
        kvStore.set(_Key, _Value);
    }

    function getFrom(string memory _Name, string memory _Key)
        public
        view
        returns (string memory)
    {
        KeyValueStore kvStore = keyValStores[_Name];
        return kvStore.lookup(_Key);
    }
}

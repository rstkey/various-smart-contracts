// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {KeyValueStore} from "../keyval_store/KeyValueStore.sol";

//! 1: since EVM contract behave like OOP objects, they can make a new instance of each other. 
//! 2: also they can call each other methods, but they need to make new instance of other contract to do it (same as objects on OOP). (check EVM details).

contract StoreFactory {
    mapping(string => KeyValueStore) public keyValStores; // hash map data type.

    function makeKeyValueStore(string memory _Name) public {
        KeyValueStore newKeyValStore = new KeyValueStore(); //! 1
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

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract KayToken is ERC20, ERC20Permit {
    constructor() ERC20("Kay Token", "KT") ERC20Permit("Kay Token") {
        _mint(msg.sender, 70000000 * 10 ** decimals());
    }
}

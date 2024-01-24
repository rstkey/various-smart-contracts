// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FundMe {
    address[] public funders;
    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        funders.push(msg.sender);
    }

    function withdraw() public onlyOwner {
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(success, "Withdraw failed!");
    }

    modifier onlyOwner() {
        require(msg.sender == i_owner, "Only owner can call this.");
        _;
    }
}

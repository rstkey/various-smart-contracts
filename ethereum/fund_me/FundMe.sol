// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

error NotOwner();
error WithdrawFailed();

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
        if (!success) {
            revert WithdrawFailed();
        }
    }

    receive() external payable {
        fund();
    }

    modifier onlyOwner() {
        if (msg.sender != i_owner) {
            revert NotOwner();
        }
        _;
    }
}

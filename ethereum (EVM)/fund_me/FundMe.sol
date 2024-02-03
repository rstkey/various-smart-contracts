// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

error NotOwner();
error WithdrawFailed();

//! 1: We can define modifier ourselves.
contract FundMe {
    address[] public funders;
    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender; //! this code will be executed at deploy time (making a instance of object) BTW.
    }

    function fund() public payable {
        funders.push(msg.sender);
    }

    function withdraw() public onlyOwner { //! 1
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

    modifier onlyOwner() { //! 1
        if (msg.sender != i_owner) {
            revert NotOwner();
        }
        _;
    }
}

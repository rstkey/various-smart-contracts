// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract HelloWorld {
    mapping(string => uint256) public nameToPoints;

    function setPoint(string memory _Name, uint256 _point) public {
        nameToPoints[_Name] = _point;
    }

    function name() public pure returns (string memory) {
        return "Hello, World!";
    }

    function lookup(string memory _Name) public view returns (uint256) {
        return nameToPoints[_Name];
    }
}

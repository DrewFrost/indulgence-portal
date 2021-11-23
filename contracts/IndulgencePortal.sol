// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;
import 'hardhat/console.sol';

contract IndulgencePortal {
    uint256 _totalSins;
    mapping(uint256 => address) public siners;
    mapping(address => string) public sins;

    constructor() {
        console.log('Come brother, tell us your sins');
        _totalSins = 0;
    }

    function indulgeTheSin(string memory sin) public {
        siners[_totalSins] = msg.sender;
        sins[msg.sender] = sin;
        _totalSins++;
    }

    function getAllSins() public view returns (string[] memory) {
        string[] memory allMessages = new string[](_totalSins);
        for (uint256 i = 0; i < _totalSins; i++) {
            console.log('%s from :%s', sins[siners[i]], siners[i]);
            allMessages[i] = sins[siners[i]];
        }
        return allMessages;
    }
}

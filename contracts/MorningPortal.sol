// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;
import 'hardhat/console.sol';

contract MorningPortal {
    uint256 _totalMessages;
    mapping(uint256 => address) public users;
    mapping(address => string) public messages;

    constructor() {
        console.log('Wake up');
        _totalMessages = 0;
    }

    function sendMorningMessage(string memory message) public {
        users[_totalMessages] = msg.sender;
        messages[msg.sender] = message;
        _totalMessages++;
    }

    function getAllMorningMessages() public view returns (string[] memory) {
        string[] memory allMessages = new string[](_totalMessages);
        for (uint256 i = 0; i < _totalMessages; i++) {
            console.log("%s from :%s", messages[users[i]], users[i]);
            allMessages[i] = messages[users[i]];
        }
        return allMessages;
    }
}

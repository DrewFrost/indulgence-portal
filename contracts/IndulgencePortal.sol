// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;
import 'hardhat/console.sol';

contract IndulgencePortal {
    uint256 _totalSins;
    mapping(uint256 => address) public sinners;
    mapping(address => string) public sins;
    mapping(string => uint256) public sinsTimestamps;

    constructor() {
        console.log('Come brother, tell us your sins');
        _totalSins = 0;
    }

    function indulgeTheSin(string memory sin) public {
        sinners[_totalSins] = msg.sender;
        sins[msg.sender] = sin;
        sinsTimestamps[sin] = block.timestamp;
        _totalSins++;
    }

    function getAllSins()
        public
        view
        returns (
            address[] memory sinner,
            string[] memory message,
            uint256[] memory timestamp
        )
    {
        sinner = new address[](_totalSins);
        message = new string[](_totalSins);
        timestamp = new uint256[](_totalSins);
        for (uint256 i = 0; i < _totalSins; i++) {
            console.log('%s from :%s', sins[sinners[i]], sinners[i]);
            sinner[i] = sinners[i];
            message[i] = sins[sinners[i]];
            timestamp[i] = sinsTimestamps[sins[sinners[i]]];
        }
        return (sinner, message, timestamp);
    }
}

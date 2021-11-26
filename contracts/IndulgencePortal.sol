// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;
import 'hardhat/console.sol';

contract IndulgencePortal {
    uint256 _totalSins;
    mapping(uint256 => string) public sins;
    mapping(uint256 => address) public sinners;
    mapping(uint256 => uint256) public timestamps;

    constructor() {
        console.log('Come brother, tell us your sins');
        _totalSins = 0;
    }

    function indulgeTheSin(string memory sin) public {
        sins[_totalSins] = sin;
        sinners[_totalSins] = msg.sender;
        timestamps[_totalSins] = block.timestamp;
        _totalSins++;
    }

    function getAllSins()
        public
        view
        returns (
            string[] memory message,
            address[] memory sinner,
            uint256[] memory timestamp
        )
    {
        message = new string[](_totalSins);
        sinner = new address[](_totalSins);
        timestamp = new uint256[](_totalSins);
        for (uint256 i = 0; i < _totalSins; i++) {
            message[i] = sins[i];
            sinner[i] = sinners[i];
            timestamp[i] = timestamps[i];
        }
    }
}

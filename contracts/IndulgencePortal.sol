// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;
import 'hardhat/console.sol';

contract IndulgencePortal {
    event NewSin(address indexed from, uint256 timestamp, string message);
    struct Sin {
        address sinner;
        string sin;
        uint256 timestamp;
    }
    uint256 _totalSins;
    Sin[] sins;

    constructor() {
        console.log('Come brother, tell us your sins');
        _totalSins = 0;
    }

    function confess(string memory _sin) public {
        require(
            bytes(_sin).length > 0,
            'You should enter your sin for confession'
        );
        sins.push(Sin(msg.sender, _sin, block.timestamp));
        _totalSins++;
        emit NewSin(msg.sender, block.timestamp, _sin);
    }

    function getAllSins() public view returns (Sin[] memory) {
        return sins;
    }

    function getTotalSins() public view returns (uint256) {
        return _totalSins;
    }
}

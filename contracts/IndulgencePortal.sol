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
    mapping(address => uint256) public lastSinConfessed;

    constructor() payable {
        console.log('Come brother, tell us your sins');
        _totalSins = 0;
    }

    function confess(string memory _sin) public {
        require(
            bytes(_sin).length > 0,
            'You should enter your sin for confession'
        );
        require(
            lastSinConfessed[msg.sender] + 13 minutes < block.timestamp,
            'Wait 13m'
        );
        lastSinConfessed[msg.sender] = block.timestamp;
        _totalSins++;
        sins.push(Sin(msg.sender, _sin, block.timestamp));
        emit NewSin(msg.sender, block.timestamp, _sin);
        uint256 randomNum = uint256(blockhash(block.number - 1)) % 14;
        if (randomNum == 13) {
            uint256 cashBack = 0.0001 ether;
            require(
                cashBack <= address(this).balance,
                'Trying to withdraw more money than the contract has.'
            );
            (bool success, ) = (msg.sender).call{value: cashBack}('');
            require(success, 'Failed to withdraw money from contract.');
        }
    }

    function getAllSins() public view returns (Sin[] memory) {
        return sins;
    }

    function getTotalSins() public view returns (uint256) {
        return _totalSins;
    }
}

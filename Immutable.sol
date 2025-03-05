// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Immutable {
    // 45718 gas
    // address public owner = msg.sender;

    // 43585 gas
    address public immutable owner;

    //one way of initializing
    constructor() {
        owner = msg.sender;
    }

    uint256 public x;

    function foo() external {
        require(msg.sender == owner);
        x += 1;
    }
}

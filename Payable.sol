// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Payable {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() external payable {}

    function getBalance() external view returns (uint256 balance) {
        return address(this).balance;
    }
}

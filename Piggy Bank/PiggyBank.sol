// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// a contract where anyone will be able to deposit ETH into this contract
// but only the owner will be able to withdraw from it.

// In a real life when you decide to withdraw from a piggy bank you first need to destroy it.

contract PiggyBank {
    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);
    address public owner = msg.sender; // the person who deploy the contract will be the owner.

    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, "not owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}

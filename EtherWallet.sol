// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "caller is not owner");
        // replace state variables with variables inside memory to save gas.
        payable(msg.sender).transfer(_amount);

        // (bool sent, ) = msg.sender.call{value: _amount}("");
        // require(sent, "Failed to send Ether");
    }

    function getBalance() external view returns (uint256 _balance) {
        return address(this).balance;
    }
}

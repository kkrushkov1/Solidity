// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Mapping {
    mapping(address => uint256) public balances; // mapping(key => value)
    mapping(address => mapping(address => bool)) public isFriend; // nested mapping

    function example() external {
        balances[msg.sender] = 123;
        uint256 bal = balances[msg.sender];
        uint256 bal2 = balances[address(1)]; // 0 since the default value of uint is 0 and there is no address 1.
        // delete balances[msg.sender];

        isFriend[msg.sender][address(this)] = true; // address(this) refers to the address of the smart contract itself. The 'to'.
    }

    function getBalance(address user) external view returns (uint256) {
        return balances[user];
    }

    function getBalanceOfAddressOne() external view returns (uint256) {
        return balances[address(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4)];
    }

    function checkFriendship(address user, address friend)
        external
        view
        returns (bool)
    {
        return isFriend[user][friend];
    }

    function getContractAddress() external view returns (address) {
        return address(this);
    }
}

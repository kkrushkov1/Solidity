// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Fallback {
    event Log(string func, address sender, uint256 value, bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    // executed when the data that was sent is empty
    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }
}

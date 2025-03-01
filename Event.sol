// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Event {
    event Log(string message, uint256 val);
    // up to 3 index.
    event IndexLog(address indexed sender, uint256 val);

    function example() external {
        emit Log("I'm a log event", 1);
        emit IndexLog(msg.sender, 789);
    }

    event Message(address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}

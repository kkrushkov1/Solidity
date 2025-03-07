// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Kill {
    constructor() payable {}

    function kill() external {
        selfdestruct(payable(msg.sender)); //  address here should be payable.
    }

    function testCall() external pure returns (uint256) {
        return 123;
    }
}

contract Helper {
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function kill(Kill _kill) external {
        _kill.kill();
    }
}

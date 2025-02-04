// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Error {
    function testRequire(uint256 _i) public pure {
        require(_i <= 10, "i > 10");
    }

    function testRevert(uint256 _i) public pure {
        if (_i > 10) {
            revert("i >10");
        }
    }

    uint256 public num = 123;

    function testAssert() public view {
        assert(num == 123);
    }



    error MyError(address caller, uint i);

    function testCustomError(uint256 _i) public view {
        if (_i > 10) {
            revert MyError(msg.sender, _i);
        }
    }
}

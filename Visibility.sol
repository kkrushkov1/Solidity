// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract VisiblityBase {
    uint256 private x = 0;
    uint256 internal y = 1;
    uint256 public z = 2;

    function privateFunc() private pure returns (uint256) {
        return 0;
    }

    function internalFunc() internal pure returns (uint256) {
        return 100;
    }

    function publicFunc() public pure returns (uint256) {
        return 200;
    }

    function externalFunc() external pure returns (uint256) {
        return 300;
    }

    function examples() external view {
        x + y + z;
        privateFunc();
        internalFunc();
        publicFunc();

        this.externalFunc(); // hacky trick, BUT gas inefficient
    }
}

contract VisibilityChild is VisiblityBase {
    function examples2() external view {
        y + z;
        internalFunc();
        publicFunc();
    }
}

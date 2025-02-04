// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// Array - dynamic or fixed size

contract Array {
    uint256[] public nums = [1, 2, 3];
    uint256[3] public numsFixed = [4, 5, 6];

    function examples() external {
        
        delete nums[1]; // 1, 0, 3
        nums.pop(); // 1, 0

        uint256[] memory a = new uint256[](5);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

library Math {
    // If you declare as public you'll have to deploy the library separately from the
    // contract Test
    function max(uint256 x, uint256 y) internal pure returns (uint256) {
        return x >= y ? x : y;
    }
}

contract Test {
    function testMax(uint256 x, uint256 y) external pure returns (uint256) {
        return Math.max(x, y);
    }
}

library ArrayLib {
    function find(uint256[] storage arr, uint256 x)
        internal
        view
        returns (uint256)
    {
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }
        revert("not found");
    }
}

contract TestArray {
    // more shorter and cleaner way:
    using ArrayLib for uint256[];
    // tells Solidity that for this data type attach all of the functionalities defined
    // inside the library array

    uint256[] public arr = [3, 2, 1];

    function testFind() external view returns (uint256 i) {
        // return ArrayLib.find(arr, 2);
        return arr.find(2);
    }
}

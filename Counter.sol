// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Counter {
    address public constant MY_ADDRESS =
        0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint256 public constant MY_UINT = 123;

    uint256 public count;

    function inc() external {
        count += 1;
    }

    function dec() external {
        count -= 1;
    }

    function example(uint x) external pure returns (uint) {
        if(x<10){
            return 1;
        }else if(x < 20){
            return 2;
        }else {
            return 3;
        }
    }
}

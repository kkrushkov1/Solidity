// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SimpleStorage{
    string public text;

    // aaaaaaaaaaaaaaaaaaaaaaaaaaaa
    // caldata 89636 gas
    // memory 90114 gas

    function set(string calldata _text) external {
        text = _text;
    }

    function get() external view returns (string memory){
        return text;
    }
}
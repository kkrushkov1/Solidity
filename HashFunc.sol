// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract HashFunc {
    function hash(
        string memory text,
        uint256 num,
        address addr
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text, num, addr)); // bytes as an input
    }

    function encode(string memory text0, string memory text1)
        external
        pure
        returns (bytes memory)
    {
        return abi.encode(text0, text1);
    }

    //0x00000000000000000000000000000000000000000000000000000000000000400000000000000000000000
    //0000000000000000000000000000000000000000800000000000000000000000000000000000000000000000
    //0000000000000000034141410000000000000000000000000000000000000000000000000000000000000000
    //0000000000000000000000000000000000000000000000000000000003424242000000000000000000000000
    //0000000000000000000000000000000000

    function encodePacked(string memory text0, string memory text1)
        external
        pure
        returns (bytes memory)
    {
        return abi.encodePacked(text0, text1);
    }

    // 0x414141424242

    function collision(string memory text0, uint x,  string memory text1)
        external
        pure
        returns (bytes32)
    {
        return keccak256(abi.encodePacked(text0, x, text1));
    }
    // Inputs: "AAAA", "BBB" and "AAA", "ABBB"
}

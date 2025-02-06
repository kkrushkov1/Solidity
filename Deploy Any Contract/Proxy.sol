// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract TestContract1 {
    address public owner = msg.sender;

    function setOwner(address _owner) public {
        require(msg.sender == owner, "not owner");
        owner = _owner;
    }
}

contract TestContract2 {
    address public owner = msg.sender;
    uint256 public value = msg.value;
    uint256 public x;
    uint256 public y;

    constructor(uint256 _x, uint256 _y) payable {
        x = _x;
        y = _y;
    }
}

contract Proxy {
    event Deploy(address); // emit the event when the contract is deployed;

    fallback() external payable {} //  when we call another contract it might send some ether back. So we declare a fallback;

    function deploy(bytes memory _code)
        external
        payable
        returns (address addr)
    {
        assembly {
            // to debloy an arbitrary contract we use 'assembly'
            // create (y,p,n)
            // y = amount of ETH to send
            // p = pointer in memory to start of code
            // n = size of code
            // the input parameter _code - the first 32 bytes encodes the length of the _code. So the actual code starts after 32 bytes.
            addr := create(callvalue(), add(_code, 0x20), mload(_code)) // callvalue() = msg.value ; 0x20 = 32 in hexadecimal ;
        }
        require(addr != address(0), "deploy failed");

        emit Deploy(addr); // we emit the event deploy logging the contract address that was deployed.
    }

    function execute(address _target, bytes memory _data) external payable {
        (bool success, ) = _target.call{value: msg.value}(_data);
        require(success, "failed");
    }
}

contract Helper {
    function getBytecode1() external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract1).creationCode;
        return bytecode;
    }

    function getBytecode2(uint256 _x, uint256 _y)
        external
        pure
        returns (bytes memory)
    {
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
        //The Contract Application Binary Interface (ABI) is the standard way to interact with contracts in the Ethereum ecosystem,
        //both from outside the blockchain and for contract-to-contract interaction
    }

    function getCalldata(address _owner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }
}

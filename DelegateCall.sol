// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract TestDelegateCall {
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(uint256 _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract DeletegateCall {
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(address _test, uint256 _num) external payable {
        // _test.delegatecall(abi.encodeWithSignature("setVars(uint256)", _num));

        // This way you don't have to write a string. So if you change the function signature
        // then you don't have to make any change here whereas if you were to use a string then
        // you will have to update the function signature of the string.
        (bool success, bytes memory data) = _test.delegatecall(
            abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num)
        );
        require(success, "delegatecall failed!");
    }
}

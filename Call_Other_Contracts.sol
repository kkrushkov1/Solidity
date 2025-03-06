// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract CallTestContract {
    function setX(TestContract _test, uint256 _x) external {
        _test.setX(_x);
    }

    function getX(address _test) external view returns (uint256 x) {
        x = TestContract(_test).getX();
    }

    function setXandSendEther(address _test, uint256 _x) external payable {
        TestContract(_test).setXandReceiveEther{value: msg.value}(_x);
    }

    function getXandValue(address _test)
        external
        view
        returns (uint256, uint256)
    {
        return TestContract(_test).getXandValue();
    }
} 

contract TestContract {
    uint256 public x;
    uint256 public value = 123;

    function setX(uint256 _x) external {
        x = _x;
    }

    function getX() external view returns (uint256) {
        return x;
    }

    function setXandReceiveEther(uint256 _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns (uint256, uint256) {
        return (x, value);
    }
}

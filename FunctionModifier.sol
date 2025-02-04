// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract FunctionModifier {
    bool public paused;
    uint256 public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    // After
    modifier whenNotPaused() {
        require(!paused, "paused");
        _; // tells solidity to call the actual function that the function modifier wraps
    }

    function inc() external whenNotPaused {
        require(!paused, "paused");
        count += 1;
    }

    // Before
    function dec() external whenNotPaused {
        count -= 1;
    }

    modifier cap(uint256 _x) {
        require(_x < 100, "x>=100");
        _;
    }

    function incBy(uint256 _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    modifier sandwich() {
        //code here
        count += 10;
        _; // foo()
        //more code here
        count *= 2;
    }

    function foo() external sandwich {
        count += 1;
    }
}

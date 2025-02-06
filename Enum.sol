// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Enum {
    enum Status {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected
    }

    Status public status;
    struct Order {
        address buyer;
        Status status;
    }

    Order[] public orders;

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) external {
        status = _status;
    }

    function ship() external {
        status = Status.Shipped;
    }

    function reset() external {
        delete status; // reset to the default value - the first item defined in the curly braces - in our case - None.
    }
}

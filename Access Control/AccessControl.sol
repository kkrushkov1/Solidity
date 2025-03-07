// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// Manage roles assigned to accounts. Depending on the role accounts will be able to call functions
// or be disallowed to call it.

contract AccessControl {
    event GrantRole(bytes32 indexed role, address indexed account);
    event RevokeRole(bytes32 indexed role, address indexed account);

    //role => account => bool

    mapping(bytes32 => mapping(address => bool)) public roles;
    // the role is bytes32 instead of string because we are gonna hash the name of the role
    // so that even if the name of the role is a really long string it still hashes
    // to bytes32. We also will save some gas.

    bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    bytes32 private constant USER = keccak256(abi.encodePacked("USER"));

    modifier onlyRole(bytes32 _role) {
        require(roles[_role][msg.sender], "not authorized");
        _;
    }

    constructor() {
        // grant admin role to the deployer of the contract
        _grantRole(ADMIN, msg.sender);
    }

    function _grantRole(bytes32 _role, address _account) internal {
        roles[_role][_account] = true;
        emit GrantRole(_role, _account);
    }

    function grantRole(bytes32 _role, address _account)
        external
        onlyRole(ADMIN)
    {
        _grantRole(_role, _account);
    }

    function revokeRole(bytes32 _role, address _account)
        external
        onlyRole(ADMIN)
    {
        roles[_role][_account] = false;
        emit RevokeRole(_role, _account);
    }
}

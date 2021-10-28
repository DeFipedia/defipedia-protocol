// SPDX-License-Identifier: GPL-3.0 //
pragma solidity ^0.8.0;

/// @author Pradhumna Pancholi
/// @title Roles Library
/// @notice this library is to store code for various roles which will be used in different comments throughout defipeedia-protocol
library Roles {
    /// @dev this role will handle delegating and revoking roles/permissions
    bytes32 public constant ADMIN_ROLE = keccak256('ADMIN');
    /// @dev this roles will be allowed to mint new tokens
    bytes32 public constant MINTER_ROLE = keccak256('Minter');
}

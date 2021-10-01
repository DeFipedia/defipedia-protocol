// SPDX-License-Identifier: GPL-3.0//
pragma solidity ^0.8.0;

import './Roles.sol';
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol';
import '@openzeppelin/contracts/access/AccessControl.sol';

/// @author Pradhumna Pancholi
/// @title WikiToken
/// @notice Contract for the erc-20 governance token "$WIKI" for Defipedia.
contract WikiToken is ERC20, ERC20Permit, ERC20Votes, AccessControl {
    /// @dev this will deploy the token, give admin and minter roles to deploying address, and sets "ADMIN_ROLE" as role admin for admin and minter role respectively
    constructor() ERC20('Wiki', 'WIKI') ERC20Permit('Wiki') {
        _setupRole(Roles.ADMIN_ROLE, msg.sender);
        _setupRole(Roles.MINTER_ROLE, msg.sender);
        _setRoleAdmin(Roles.ADMIN_ROLE, Roles.ADMIN_ROLE);
        _setRoleAdmin(Roles.MINTER_ROLE, Roles.ADMIN_ROLE);
    }

    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override(ERC20, ERC20Votes) {
        super._afterTokenTransfer(from, to, amount);
    }

    /// @dev Mints the token for the recipient if they have minter role
    /// @notice This function will mint and send tokens if caller have minter role. Otherwise, it will be reverted

    /// @param to, the address to send minted tokens
    /// @param amount, the amount of tokens to burn
    function _mint(address to, uint256 amount) internal override(ERC20, ERC20Votes) {
        /// check if calling account has MINTER_ROLE
        require(
            hasRole(Roles.MINTER_ROLE, msg.sender),
            'Caller account does not have permission to mint.'
        );
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount) internal override(ERC20, ERC20Votes) {
        super._burn(account, amount);
    }
}

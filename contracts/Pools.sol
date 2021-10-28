// SPDX-License-Identifier: GPL-3.0 //
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/access/AccessControl.sol';
import '@openzeppelin/contracts/utils/Context.sol';
import './Roles.sol';

/// @author Pradhumna Pancholi ///
/// @title Pools ///
/// @notice This contract holds code for all the availble pools to provide yield farming opportunities for $WIKI. ///
contract Pools is Roles, Context {
    // ToDo //
    // stakeTokens - DAI, USDC, and ETH are going to be initial pools //
    // unStakeToken //
    // issueTokens (process yield to users) //
    // addAllowTokens - to add more pools //
    // getETHValue //

    //ToDo: store and keep track of amount of tokens staked -- distinct pool tokens //
    // mapping to store and keep track of balances of tokens for users //
    mapping(address => mapping(address => uint256)) public stakingBalance;

    //array to keep track of allowed tokens//
    address[] public poolTokens;

    constructor() {
        // ToDo - need to set dAppToken  which will be global variable//
        _setupRole(Roles.ADMIN_ROLE, msgSender());
    }

    // function to stake tokens //
    //function to add token to the supported list //
    function addPoolToken(address _token) public {
        require(
            hasRole(Roles.ADMIN_ROLE, msgSender()),
            'Caller account doesn not hve permission to add token'
        );
        // ToDo: check if it already exists before pushing// 
        for(uint index = 0; index < poolTokens.length; index++) {
            if(poolTokens[index] == )
        }
        poolTokens.push(_token);
    }

    //modifier to check if token is aallowed//
    modifier onlyPoolTokens(address _token) {
        for (
            uint256 allowedTokenIndex = 0;
            allowedTokenIndex < allowedTokens.length;
            allowedTokenIndex++
        ) {
            if (allowedTokens[allowedTokenIndex] == _token) {
                _;
            }
        }
    }

    // we need token and  ammount //
    //we need to check that amount is not 0//
    // we need to check that token is allowed //
    // perform action to tranfer token //
    // add balance to keep track //
    function stake(uint256 _amount, address _token) public payable onlyPoolTokens(_token) {
        require(msg.value > 0, 'Amount can not be 0');
        //ToDo perform transferFrom using Interface //
        IERC20(_token).transferFrom(msgSender(), address(this), _amount);
        stakingBalance[_token][msgSender()] += _amount;
    }
}

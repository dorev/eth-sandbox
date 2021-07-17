//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// a lire
// https://medium.com/@jgm.orinoco/understanding-erc-20-token-contracts-a809a7310aa5

contract Fundraiser
{
    uint256 public tokenBalance;
    address erc20token;
    // token ABI injections for purchase, description, etc...
    // or just token address maybe??

    address beneficiary;

    uint public creationTime;
    address public foundation;
    uint duration;

    constructor(address _foundation)
    {
        foundation = _foundation;
    }

    function addFunds(uint256 _amount) public
    {
        balance += _amount;
    }

    function purchaseToken(uint256 _amount)
        public
        payable
    {
        required(msg.value >= (_amount * tokenPrice));
        tokenBalance += _amount;
    }
    
    
    modifier onlyOwner
    {
        require(owner == msg.sender);
        _;
    }

    modifier onlyAfter(time)
    {
        require(time >= block.timestamp);
        _;
    }
    
    function liquidate ()
        public
        onlyOwner
        onlyAfter(creationTime + duration)
    {
        
    }



}

contract Foundation
{
    address private owner;
    uint256 public balance;
    Fundraiser[] public fundraisers;

    constructor()
    {
        owner = msg.sender;
    }

    modifier onlyOwner
    {
        require(owner == msg.sender);
        _;
    }

    function startFundraiser () internal onlyOwner
    {

    }

    function addBeneficiary()



}
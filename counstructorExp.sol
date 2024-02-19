// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//////////////////////////////////////////////////////////////////////////////
///////////////// Constructor ( It runs one time ) //////////////////////////
////////////////////////////////////////////////////////////////////////////


// We want just the creator of the contract withdraw money from the contract

contract Test{
    address public owner;
    constructor(){
        owner = msg.sender;
    }
    receive() external payable {}

    function withdraw(uint amount) public{
        require( msg.sender == owner , " you are not the owner");
        require( address(this).balance>=amount , "Not enough money" );
        (bool sent,) = payable(owner).call{value:amount}("");
        require(sent, "failed to send");
    }
}
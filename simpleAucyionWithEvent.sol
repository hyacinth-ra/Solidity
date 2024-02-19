// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//////////////////////////////////////////////////////////////////////////////
/////////////////////////  Events (Write Auction ) //////////////////////////
////////////////////////////////////////////////////////////////////////////


contract Auction{
    address owner;
    uint highestBid;
    address highestBidder;

    mapping( address => uint ) oldBids;

    event Bid(address indexed bidder, uint value);

    event StopAuction (address indexed highestBidder, uint highestBid);

    constructor(){
        owner = msg.sender;
    }

    function bid () external payable{
        require(msg.value > highestBid, "Sorry, bid too low");
        require(msg.sender != owner, " owneer cannot bid");
        oldBids[highestBidder] = highestBid;
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit Bid(msg.sender,msg.value); // This is recorded on the blockchian and everyone can see that
    }

    function withdraw () external{
        require( msg.sender != owner , "owner cannot withdraw");
        uint value = oldBids[msg.sender];
        oldBids[msg.sender] = 0;
        (bool sent,) = payable(msg.sender).call{value:value}("");
        require(sent, "payment failed");
    }

    function stopAuction() external{
        require(owner == msg.sender, "you are not the owner");
        emit StopAuction(highestBidder, highestBid);
        selfdestruct(payable(owner));
    }
}
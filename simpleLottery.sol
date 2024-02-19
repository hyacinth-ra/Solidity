// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//////////////////////////////////////////////////////////////////////////////
///////////////////////// Write a code for lottery //////////////////////////
////////////////////////////////////////////////////////////////////////////


contract Winner{
    uint balance;
    address winner;
    function pay() external payable{
        require(msg.value == 1 ether, "You need to send 1 ether");
        balance += 1 ether;
        if (balance == 7 ether){
            winner = msg.sender;
        }
    }

    function withdraw() public{
        require(msg.sender == winner, "you are not the winner");
        (bool sent,) = payable(winner).call{value: 7 ether}("");
        require ( sent, "payment failed");
    }
}
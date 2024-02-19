// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract receivingEth{

    uint public receiver;
    uint public fallbackReceived;
    uint public payReceived;

    function pay() external payable{
        payReceived += msg.value;
    }

    receive() external payable {
        receiver += msg.value;
    }

    fallback() external payable {
        fallbackReceived += msg.value;
    }
}
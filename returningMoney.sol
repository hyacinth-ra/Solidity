// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


//////////////////////////////////////////////////////
///////////////// Returning money ///////////////////
////////////////////////////////////////////////////

// if the value that user paid was gretaer than 1000 just accept 1000 
// and the contract returns the remaining to the sender
contract ReturningMoneyFirst{
    function pay() external payable{
        uint value = msg.value;
        if (value>1000){
            payable(msg.sender).transfer(value-1000);
        }
    }
}
////////////////////////////////////////////////////
// The previous code may be failed. 
// To solve the problem we use the following code: 
///////////////////////////////////////////////////
contract ReturningMoneySecond{
    mapping(address => uint) changeOwed;
    function pay() external payable{
        uint value = msg.value;
        if (value>1000){
            changeOwed[msg.sender] = value - 1000;
        }
    }
    function withdraw() public{
        uint value = changeOwed[msg.sender];
        changeOwed[msg.sender] = 0;
        payable(msg.sender).transfer(value);
    }
}
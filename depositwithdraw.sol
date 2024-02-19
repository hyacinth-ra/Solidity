// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

///////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
////// Deposit & withdraw from an account (require, assert, revert) /////////
////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

contract DepositWithdrawRAR{
    mapping( address => uint ) balances;

    function deposit() external payable{
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public{
        uint balance = balances[msg.sender];
        require(balance >= amount, "Balance is not sufficient");
        (bool sent,) = payable(msg.sender).call{value:amount}("");
        // require(sent,"Payment failed"); 
        ////// OR //////
        if (!sent){
            revert("payment failed");
        }

    }

}

///////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
////// Deposit & withdraw from an account (error, revert) ///////////////////
////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

error BalanceNotEnough (uint balance, uint amount);

contract DepositWithdrawER{
    mapping( address => uint) balances;
    function deposit() external payable{
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        uint balance = balances[msg.sender];
        if ( balance < amount ){
            revert BalanceNotEnough( balance , amount );
        }
        balances[msg.sender] -= amount;
        (bool sent,) = payable(msg.sender).call{value:amount}("");
        if (!sent){
            revert();
        }
    }
 
}

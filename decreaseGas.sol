// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// Gas ////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

// Gas units: How much gas is needed to execute specific operation? (Positive Integer)
// Gas price: How much we should pay for an unit of a gas (gwei)
//            gas price = base fee (it is burnt) + tip (or priority fee)
// Tx fee: cost of the Transaction
//         Tx fee = Gas units * Gas price
//         Tx fee sent - cost = refund
//         Tx fee sent = max fee = gas limit
////////////////////////////////////////////////
//
// soft limit: each block has approximately maximum 8,000,000 gas(gwei)
////////////// convert some operation to small operations./////////////

contract Test1{
    uint public sum;
    uint constant sumTo = 1000;
    function addInteger() public{
        for (uint i=0; i<=sumTo; i++){
            sum += i;
        }
    }
}

// ///// convert to small ones:
// ///// and show the gas used
contract Test2{
    uint public sum;
    uint constant sumTo = 1000;
    uint start = 1;
    uint end = 100;
    uint increment = 100;
    uint public gasLeft;
    function addInteger() public{
        uint gasStart = gasleft();
        require(end<=sumTo);
        for (uint i=start; i<=end; i++){
            sum += i;
        }
        start = end + 1;
        end += increment;
        gasLeft = gasStart - gasleft();
    }
}

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

///////////////////////////////////////////////////////////////////////////////////
////////////////////////////// Modification //////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

//// modifier name (parameters){
////    require(condition);
////    _;
//// }
contract TestOne {
    uint public x;
    modifier greaterNum(uint value, uint min){
        require( value >= min , "greater than");
        if (true){
            _;
        }
        setX(1);
    }
    function setX(uint v) public{
        x = v;
    }
    function subtract(uint V1, uint V2) greaterNum(V1,V2) public returns(uint a){
        return(V1-V2);
    }
}

contract TestTwo{
    address owner;
    constructor(){
        owner = msg.sender;
    }

    modifier ownerOnly{
        require(msg.sender==owner,"you are not the owner");
        _;
    }

    function test1() public view ownerOnly returns (uint){
        return 1;
    }

    function test2() public view ownerOnly returns(uint){
        return 2;
    }
}

contract TestThree{
    uint x;
    uint y;
    uint z;
    modifier cost (uint value){
        require(msg.value>=value);
        _;
    }
    modifier greather(uint value, uint min){
        require(value>=min);
        _;
    }

    function setX(uint num) public payable cost(1 ether) greather(num,10){
        x = num;
    }
}

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////  Abstract Contract /////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

abstract contract AbstractMath{

    function returnConst() public pure returns(uint){
        return 100;
    }
    function getValue() public virtual view returns(uint);

    function add5() public view returns(uint){
        return getValue() + 5;
    }
}

contract Math is AbstractMath{
    uint x;
    function setX(uint val) public{
        x = val;
    }
    function getValue() public override view returns(uint){
        return x;
    }
}

abstract contract AbstractMath2{
    uint x;
    constructor(uint _x){
        x = _x;
    }
    function returnConst() public pure returns(uint){
        return 100;
    }
    function getValue() public virtual view returns(uint);

    function add5() public view returns(uint){
        return getValue() + 5;
    }
}

contract Math2 is AbstractMath2(10){

    function setX(uint val) public{
        x = val;
    }
    function getValue() public override view returns(uint){
        return x;
    }
}
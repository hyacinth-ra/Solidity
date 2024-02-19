// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

///////////////////////////////////////////////////////////////////////////////////
//////////////////////////////  Parent & Child  //////////////////////////////////
//////////////////////////////// Contarcts //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// Consider the child contract has parent A and parent B and A and B have the functions with same name and inputs
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

contract A{
    uint x;
    function setX(uint val) virtual public{
        x = val;
    }
    function getX() public virtual view returns(uint){
        return 1;
    }
}

contract B{
    uint y;
    function setX(uint val) public virtual {
        y = val;
    }
    function getX() public virtual view returns(uint){
        return 2;
    }
}

contract Child is B,A{ //That means contract A has the higher priority than contract B. 
    function setX(uint val) public override (A,B){
        super.setX(val);
    }
    function getX() public override (A,B) view returns(uint){ 
        // the order of the contract is not important here we can write A,B or B,A
        return super.getX();
    }
}

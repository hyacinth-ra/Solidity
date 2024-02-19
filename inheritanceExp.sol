// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

///////////////////////////////////////////////////////////////////////////////////
//////////////////////////////  Inheritance  /////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

contract Storage{
    uint public x;

    function setX(uint val) public{
        x = val;
    }
}

contract caller{
    Storage store;
    Storage store2;

    constructor(){
        store = new Storage();
        store2 = new Storage();
    }

    function setX(uint val) public{
        store.setX(val);
    }

    function setX2(uint val) public{
        store2.setX(val);
    }

    function getX() public view returns(uint){
        return store.x();
    }

    function getX2() public view returns(uint){
        return store2.x();
    }
}

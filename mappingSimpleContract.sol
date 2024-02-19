// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract mappingTest{
    mapping(uint => bool) name;

    function addItem (uint key, bool value) public{
        name[key] = value;
    }

    function getItem ( uint key) public view returns(bool){
        return name[key];
    } 

    mapping(uint => uint) map1;

    function x() public{
        mapping(uint =>uint) storage map2 = map1;
        map2[0] = 1;
    }

    function getItemmap1 ( uint key) public view returns(uint){
        return map1[key];
    } 

    function viewGas() public view returns(uint){
        return gasleft();
    }
}